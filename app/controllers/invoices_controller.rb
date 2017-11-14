class InvoicesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_invoices, only: [:show, :approve, :cancel, :paid]

  def index
    if params[:global_search]  && params[:global_search][:query]
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
    create_invoice

    if @invoice.save
      redirect_to invoice_path(@invoice)
    else
      render :new
    end
  end

  def edit
  end

  def update
    @invoice.update(invoice_params)
    redirect_to invoice_path(@invoice)
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

  def create_invoice
    Profile.all.each do |profile|
      if profile.user != current_user
        @invoice = Invoice.new(invoice_params)
        @invoice.admin = current_user.profile.admin
        @invoice.profile = profile
        @invoice.save
      end
    end
  end

  def set_invoices
    @invoice = Invoice.find(params[:id])
  end

  def invoice_params
    params.require(:invoice).permit(:profile_id, :admin_id, :date, :amount, :title, :bank_account, :status)
  end
end
