class Admin::DownloadStickersController < Admin::ApplicationController

  def show
    respond_to do |format|
      format.pdf { send_sticker_pdf }
      if Rails.env.development?
        format.html { render_sample_html }
      end
    end
  end

  private

  def sticker
    @sticker = Sticker.find(params[:sticker_id])
  end

  def sticker_download
   DownloadSticker.new(sticker)
  end

  def send_sticker_pdf
    send_file sticker_download.to_pdf, sticker_download_attributes
  end

  def sticker_download_attributes
    {
      filename: sticker_download.filename,
      type: "application/pdf",
      disposition: "inline",
      viewport_size: '1280x1024',
    }
  end
end