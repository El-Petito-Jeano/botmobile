require 'rubygems'
require 'nokogiri'
require 'active_record'

# all the great different ways to access the db, to
# get information in it or to put new
class Access

        def add_debt_to (person, driver, amount)
                # if the person has never went with the driver, just create the new entry
                # add to table :debts rpz the amount for the person to the driver
        end # add_debt_to (person, driver, amount)

        def has_paid (driver, person, amount)
                # debt - amount
        end # has_paid (driver, perso, amount)

        def reset_debt_of (person, driver)
                # delet the debt of the person to the driver
        end # reset_deb_of (person, driver)

end # class
