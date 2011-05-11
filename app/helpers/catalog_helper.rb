module CatalogHelper
  def status_options
    {
        t("label.status.open") => :"open",
        t("label.status.close") => :"close",
        t("label.status.suspend") => :"suspend",
        t("label.status.pending") => :"pending",
    }
  end
end
