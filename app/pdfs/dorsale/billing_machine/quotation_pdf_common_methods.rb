module Dorsale::BillingMachine::QuotationPdfCommonMethods
  def build
    super
    build_attachments
  end

  def build_attachments
    main_document.attachments.each do |attachment|
      next unless File.extname(attachment.file.path) == ".pdf"

      file     = attachment.file.path
      nb_pages = ::CombinePDF.load(file).pages.count

      nb_pages.times do |i|
        start_new_page template: file, template_page: (i+1)
      end
    end
  end
end
