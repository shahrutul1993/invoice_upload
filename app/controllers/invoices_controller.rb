class InvoicesController < ApplicationController
	  def index
	   @invoices = Invoice.order(:id)
	    respond_to do |format|
	      format.html
	      format.csv { send_data @invoices.to_csv }
	     
	    end
	  end

	  def import
	    Invoice.import(params[:file])
	    redirect_to root_url, notice: "Invoice imported."
	  end


	  # private
	  #   def set_invoice
	  #     @invoice = Invoice.find(params[:id])
	  #   end

	    # def invoice_params
	    #   params.require(:invoice).permit(:type, :document_number,:due_date,:doc_date,amount)
	    # end
end

