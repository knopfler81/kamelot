require "render_anywhere"

class DownloadSticker
  include RenderAnywhere

  def initialize(sticker)
    @sticker = sticker
  end

  def to_pdf
    kit = PDFKit.new(as_html)
    kit.to_file("tmp/sticker.pdf")
  end

  def filename
    "etiquette #{sticker.id}.pdf"
  end

  private

  attr_reader :sticker

  def as_html
    render template: "admin/stickers/pdf",
      layout: "invoice_pdf",
      locals: { sticker: sticker },
      margin_top: 0.10,
      margin_bottom: 0.10,
      orientation: 'landscape'
  end
end