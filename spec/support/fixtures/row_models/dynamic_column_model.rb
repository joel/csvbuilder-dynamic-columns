class DynamicColumnModel
  include Csvbuilder::Model

  column :first_name
  column :last_name
  dynamic_column :skills
end

#
# Import
#
class DynamicColumnImportModel < DynamicColumnModel
  include Csvbuilder::Import
end

#
# Export
#
class DynamicColumnExportModel < DynamicColumnModel
  include Csvbuilder::Export
end

class DynamicColumnExportWithFormattingModel < DynamicColumnModel
  include Csvbuilder::Export
  class << self
    def format_cell(cell, column_name, context)
      cell.upcase
    end
  end
end
