class Accident < ActiveRecord::Base
    serialize :contributing_factors

    def self.leading_causes
      cause_hash = {}
      self.causes.each {|cause| cause_hash[cause.to_sym] = self.all.count{|acc| acc.contributing_factors.include?(cause)}}
      Hash[cause_hash.sort_by{|k, v| v}.reverse]
    end

    def self.causes
       self.all.map{|accident| accident.contributing_factors}.flatten.uniq
    end
end
