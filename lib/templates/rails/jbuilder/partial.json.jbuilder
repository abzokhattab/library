json.extract! < %= file_name %>, <%= full_attributes_list % >
  json.link < %= singular_table_name.pluralize.gsub(/_v([0-9]+)/,"") %>_url(<%= file_name % >, format : :json)