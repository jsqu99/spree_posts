Deface::Override.new(
  :name => "add_posts_tab_to_admin",
  :virtual_path => "spree/layouts/admin",
  :insert_bottom => "[data-hook='admin_tabs']",
  :text =>  "<%= tab :posts,  :url => spree.admin_posts_path, :icon => 'icon-file' %>",
)
