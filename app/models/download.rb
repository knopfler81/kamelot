require "render_anywhere"

class Download
  include RenderAnywhere

  def initialize(order)
    @order = order
  end

  def to_pdf
    kit = PDFKit.new(as_html)
    kit.to_file("tmp/facture.pdf")
  end

  def filename
    "Invoice #{order.id}.pdf"
  end

  private

  attr_reader :order

  def as_html
    render template: "clients/orders/pdf",
      layout: "invoice_pdf",
      locals: { order: order }
  end
end