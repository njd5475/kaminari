require 'kaminari/models/active_record_model_extension'

module Kaminari
  module ActiveRecordExtension
    extend ActiveSupport::Concern
    included do
      # Future subclasses will pick up the model extension
      class << self
        def inherited(kls) 
          super
          kls.send(:include, Kaminari::ActiveRecordModelExtension) if kls.superclass == ::ActiveRecord::Base
        end
      end

      # Existing subclasses pick up the model extension as well
      self.descendants.each do |kls|
        kls.send(:include, Kaminari::ActiveRecordModelExtension) if kls.superclass == ::ActiveRecord::Base
      end
    end
  end
end
