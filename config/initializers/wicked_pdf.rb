# WickedPDF Global Configuration
#
# Use this to set up shared configuration options for your entire application.
# Any of the configuration options shown here can also be applied to single
# models by passing arguments to the `render :pdf` call.
#
# To learn more, check out the README:
#
# https://github.com/mileszs/wicked_pdf/blob/master/README.md


if Rails.env.production?
  WickedPdf.config = {

  # Path to the wkhtmltopdf executable: This usually isn't needed if using
  # one of the wkhtmltopdf-binary family of gems.
  exe_path: Gem.bin_path('wkhtmltopdf-heroku', 'wkhtmltopdf-linux-amd64'),
  page_size: 'Letter',
  orientation: 'Portrait',
  margin: { top:    2,
           bottom: 2,
           left:   2,
           right:  2 }
 }

else
  
 WickedPdf.config = {
    exe_path: '/usr/local/bin/wkhtmltopdf',
    page_size: 'Letter',
    orientation: 'Landscape',
    margin: { top:    2,
             bottom: 2,
             left:   2,
             right:  2 }

  }
end

