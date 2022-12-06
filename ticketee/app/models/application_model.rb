# this class will act as a root for all application models
# this class will be similar to ApplicationRecord.
# in that it defines logic that is common to all models in the application

# by inheriting from ROM::Struct this model acts in similar fashion
# to the ActiveRecord models we know

# ROM::Struct allows us to create new instances of this model
class ApplicationModel < ROM::Struct
  def self.inherited(klass)
    # this method initially calls super. which will call
    # ROM::Struct owns inherited method
    super

    # we extend the class with ActiveModel::Naming module
    # this adds methods to the instances of any model
    # this module is helpful from this particular module
    # is the model_name method, which is used in polymorphic URL routing
    klass.extend ActiveModel::Naming

    # the ActiveModel::Conversion module adds methos like
    # to_model and to_param. these methods are used in rails also
    # for routing and formss
    klass.include ActiveModel::Conversion

    # this method comes from a parent class of ROM::Struct
    # called Dry::Struct.
    # Subclasses of Dry::Struct and ROM::Struct require all attributes
    # to be specified during initialization of their objects

    # what transform_types line tells Dry::Struct to allow is for us
    # to initialize objects without requiring all attributes of that object
    # to be specified, this line allows for this code to work:
    # Projects::Project.new
    klass.transform_types { |t| t.required(false) }
  end

  def persisted?
    respond_to?(:id) && id.present?
  end
end
