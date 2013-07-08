require 'rubygems'
require 'nokogiri'
require 'active_record'

# Defining classes to describe the DB
class Worker < ActiveRecord::Base
        has_one         :car
        has_many        :debts
end # class

class Car < ActiveRecord::Base
        belongs_to      :workers
end # class

class Debt < ActiveRecord::Base
        belongs_to      :workers
end # class

# Actions related to the DB
class Install

        # Establish the connection to the database
        def establish_connec
        ActiveRecord::Base.establish_connection(
                :adapter => "sqlite3",
                :database  => "db/db_bot.sqlite3"
        )
        end # establish_connec()

        # Perform the installation :
        # - Install the database
        # +env+ the environement
        def init
                puts ActiveRecord::Base.connection.tables
                if ActiveRecord::Base.connection.table_exists? 'workers'
#               unless Property.table_exists?
                        give_infos(Worker)
                        # Systematically dropin the table is not
                        # ideal but we won't do this shit during prod
                        ActiveRecord::Migration.drop_table(:workers)
                end
                create_table_details
                if ActiveRecord::Base.connection.table_exists? 'cars'
                        give_infos(Car)
                        ActiveRecord::Migration.drop_table(:cars)
                end
                create_table_cars
                if ActiveRecord::Base.connection.table_exists? 'debts'
                        give_infos(Debt)
                        ActiveRecord::Migration.drop_table(:debts)
                end
                create_table_debts
        end # init()

        # Wadafak
        private

        # Puts all the existing data if there is
        def give_infos(table)
                puts 'IM ON A BOAT'
                puts table.count
                for i in 1..table.count.to_i
                        puts table.where(:id => i).explain
#                       puts 'WHEEEEHIHIHIHEE'
                end
                puts table.where(:id => 1).explain
        end # give_infos(Table)
        # Creating all the tables
        def create_table_workers
                ActiveRecord::Schema.define do
                        create_table :workers, :force => true do |t|
                        t.string :fname         # first name
                        t.string :lname         # last name
                        end
                end
        end # create_table_workers()
        def create_table_cars
                ActiveRecord::Schema.define do
                        create_table :cars, :force => true do |t|
                        t.float  :price         # price for one way
                        t.string :owner
                        end
                end
        end # create_table_cars()
        def create_table_debts
                ActiveRecord::Schema.define do
                        create_table :debts, :force => true do |t|
                        t.string :who           # the one who pays
                        t.string :towho         # the one who gets paid
                        t.float  :amount        # total of the debt
                        end
                end
        ned # create_table_debts
end # class

# Getting the database ready to use :
# Building, connecting and initializing
puts 'Installing the Vulnerability Database'
db = Install.new()
puts 'Connecting to the Vulnerability Database'
db.establish_connec
puts 'Initializing'
db.init
