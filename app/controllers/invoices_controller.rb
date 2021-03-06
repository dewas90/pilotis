class InvoicesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_section_ids, only: [:create]
  before_action :set_invoices, only: [:show, :approve, :edit, :update, :cancel, :paid]
   before_action :find_invoices, only:[:markaspaid]
  def index
    if params[:global_search] && params[:global_search][:query]
      @invoices = Invoice.global_search(params[:global_search][:query])
      @query = params[:global_search][:query]
    else
      @invoices = Invoice.all
      @query = nil
    end
    respond_to do |format|
      format.html
      format.xlsx {
        response.headers['Content-Disposition'] = 'attachment; filename="all_invoices.xlsx"'
      }
    end
    @invoice = Invoice.new
  end


  def custom_index
    @invoices = Invoice.global_search()
  end

  def show
  end

  def new
    @invoice = Invoice.new
  end

  def create
    @section_ids.each do |id|
      @success = create_invoices(id)
      break unless @success
    end
    if @success
      flash[:notice] = "Invoices successfully created"
      redirect_to invoices_path
    else
      render :new
    end
  end

  def edit
  end

  def markaspaid
    respond_to do |format|
      format.js
    end
    @invoice.status = "paid"
    @invoice.save
    render js: "window.location = '/invoices'"
  end

  def update
    @invoice.update(invoice_params)
    if @invoice.save
      redirect_to invoices_path
    else
      render :edit
    end
  end

  def paid
    @invoice.status = "paid"
    redirect_to invoices_path
  end

  def unpaid
    @invoice.status = "unpaid"
    @invoice.save
  end

  private

  def create_invoices(section_id)
    success = true
    Profile.where(section_id: section_id).each do |profile|
      if profile.user != current_user
        @invoice = Invoice.new(invoice_params)
        @invoice.admin = current_user.profile.admin
        @invoice.profile = profile
        if @invoice.save
          @invoice.save
          UserMailer.invoice(@invoice.profile.user).deliver_now
        else
          success = false
        end
      end
    end
    success
  end

  def set_section_ids
    @section_ids = params.require(:sections)["section_ids"].reject { |x| x.blank? }
  end

  def find_invoices
    @invoice = Invoice.find(params[:invoice_id])
  end
  def set_invoices
    @invoice = Invoice.find(params[:id])
  end

  def invoice_params
    params.require(:invoice).permit(:profile_id, :admin_id, :date, :amount, :title, :bank_account, :status, :due_date, :section)
  end
end
