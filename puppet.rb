require 'rubygems'
require 'nokogiri'
require 'active_record'

class Puppet

        # lolcommentlol return the money for
        # a single way in function of the nb of people
        def price_per_person(price, nb)
                return price/nb
        end # price_per_person(price, nb)

        # new drive so the debt for each people
        # in function of the driver rises
        def new_drive (driver, people)
                # people is an array
                # need a way to get the price associated with the driver TODO

                ppp = price_per_person(price, people.count)
                people.each do |dood|
                        # add_debt_to(dood, driver, ppp)
                end
        end # new_drive

        # god, driver haz to get money
        # lets use a hash list person-money representin' the good
        # pay back
        def this_iz_payday(driver, hash)
                # TODO :
                # hash is a hash list, key : person, value : amount of dollz

                # for each couple, Access.has_paid(driver, person, amount)

                # need a timestamp TODO
        end # reset()

end # class
