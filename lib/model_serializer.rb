require "model_serializer/version"
require "active_support"
require "active_record"

module ModelSerializer
	extend ActiveSupport::Concern
	
	included do
		
	end

	module ClassMethods
      def json_options
        @json_options
      end

      def json_options=(v)
        @json_options = v
      end

      def json(*options)
      	options.unshift(:id) if !options.include?(:id) # Insert :id if not inserted
      	# options << :db if !options.include?(:db) # Insert :db if not inserted
      	self.json_options = options
        class_eval do
          def json(rooted=true, *args)
          	result = {}
          	
          	self.class.json_options.each do |key|
          		result[key] = eval("self.#{key}")
          	end

            args.each do |key|
              result[key] = eval("self.#{key}")
            end

          	if rooted
              wrapper = {}
              wrapper[self.class.name.underscore] = result
              wrapper
            else
              result
            end
          end
        end
      end
    end
end

ActiveRecord::Relation.class_eval do
	def json(*args)
    lst = self.map { |modl| modl.json(false, *args) }
    res = {} 
    res[self.model.name.underscore.pluralize] = lst
		return res
	end
end

Array.class_eval do
  def json(*args)
    arr = self.map { |modl| modl.json(false, *args) }
  end
end

ActiveRecord::Base.send :include, ModelSerializer