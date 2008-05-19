module Arel
  class Compound < Relation
    attr_reader :relation
    hash_on :relation
    delegate :joins, :selects, :join?, :orders, :groupings, :inserts, :taken,
             :skipped, :name, :aggregation?, :column_for,
             :engine, :table, :table_sql,
             :to => :relation
    
    def attributes
      @attributes ||= relation.attributes.collect { |a| a.bind(self) }
    end
    
    def selects
      @selects ||= relation.selects.collect { |s| s.bind(self) }
    end
    
    def groupings
      @groupings ||= relation.groupings.collect { |g| g.bind(self) }
    end
    
    def orders
      @orders ||= relation.orders.collect { |o| o.bind(self) }
    end
  end
end