Refinery::PagesController.class_eval do
  
  before_filter :load_page_tabs, :only => [:home, :show, :preview]
    
protected
    
  def load_page_tabs
    @tabs = if action_name == "preview"
      @page.parts.select{ |part| part.title.present? and part.title =~ /^tabcontent/}
    else
      ac = Refinery::PagePart.arel_table[:title].matches("tabcontent%")
      @page.parts.where(ac).order("title ASC")
    end
  end

end
