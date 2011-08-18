module DateTimeMacro
  extend ActiveSupport::Concern

  module ClassMethods
    def define_date_and_time(the_date)
      self.class_eval <<-RUBY

        attr_accessor :#{the_date}_date, :#{the_date}_time

        def #{the_date}_date
          self.#{the_date}.to_date unless #{the_date}.nil?
        end

        def #{the_date}_date=(value)
          if value.respond_to?(:strftime)
            new_date = value.strftime("%Y-%m-%d")
          else
            new_date = value
          end

          if new_date.blank?
            self.#{the_date} = nil
            return
          end

          unless self.#{the_date}.nil?
            new_date = new_date + self.#{the_date}.strftime(" %H:%M:%S")
          end
          self.#{the_date} = Time.parse(new_date)
        end

        def #{the_date}_time
          unless self.#{the_date}.nil?
            self.#{the_date}.to_time.strftime("%H:%M:%S")
          end
        end

        def #{the_date}_time=(value)
          if value.respond_to?(:strftime)
            new_time = value.strftime("%H:%M:%S")
          else
            new_time = value
          end

          unless self.#{the_date}.nil?
            new_time = self.#{the_date}.strftime("%Y-%m-%d ") + new_time
          end

          unless new_time.nil?
            self.#{the_date} = Time.parse(new_time)
          end
        end

      RUBY

    end
  end

end