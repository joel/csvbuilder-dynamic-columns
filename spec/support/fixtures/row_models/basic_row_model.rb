class BasicRowModel
  include Csvbuilder::Model

  column :string1
  column :string2, header: 'String 2'
end

#
# Import
#
class BasicImportModel < BasicRowModel
  include Csvbuilder::Import
end

#
# Export
#
class BasicExportModel < BasicRowModel
  include Csvbuilder::Export
end
