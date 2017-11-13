class InvoicesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_invoices , only: [:show, :approve, :cancel]

  def index
    @invoices = Invoice.all
  end

  def show
  end

  def new
    @invoice = Invoice.new
  end

  def create
    create_invoice

    if @invoice.save
      redirect_to camp_site_path(@camp_site)
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
    @invoice.save
  end

  def unpaid
    @invoice.status = "unpaid"
    @invoice.save
  end

  private

  def create_invoice
   # @invoice = Invoice.find(params[:id])
   @admin = current_user.profile.admin
   @invoice = Invoice.new(admin:@admin)
   @invoice.save
  end



  def set_invoices
    @invoice = Invoice.find(params[:id])
  end

  def invoice_params
    params.require(:invoice).permit(:user_id, :admin_id, :date, :amount, :title, :bank_account, :status)
  end
end
