module Seeders
  module Logos

    class << self

      def seed
        logos.each do |attributes|
          logo = Logo.where(title: attributes[:title]).first
          if logo.nil?
            logo = Logo.new
            logo.state = attributes[:state]
            logo.title = attributes[:title]
            image = File.open(File.join(Rails.root, attributes[:logo]))
            logo.logo = image
          else
            logo.update_attributes(attributes)
          end
          logo.save!
        end
      end

      def logos
        [
          {
            title: "AIG",
            logo: "/app/assets/images/aig.gif",
            state: "approved"
          },
          {
            title: "altria",
            logo: "/app/assets/images/altria.gif",
            state: "approved"
          },
          {
            title: "Berkshire Hathaway",
            logo: "/app/assets/images/berkshirehathaway.gif",
            state: "approved"
          },
          {
            title: "Chevron",
            logo: "/app/assets/images/chevron.jpg",
            state: "approved"
          },
          {
            title: "Citi Group",
            logo: "/app/assets/images/citigroup.gif",
            state: "approved"
          },
          {
            title: "Conoco Phillips",
            logo: "/app/assets/images/conocophillips.gif",
            state: "approved"
          },
          {
            title: "Exxon",
            logo: "/app/assets/images/exxon.jpg",
            state: "approved"
          },
          {
            title: "Ford",
            logo: "/app/assets/images/ford.gif",
            state: "approved"
          },
          {
            title: "General Electric",
            logo: "/app/assets/images/general_electric.jpg",
            state: "approved"
          },
          {
            title: "General Motors",
            logo: "/app/assets/images/general_motors.gif",
            state: "approved"
          },
          {
            title: "Home Depots",
            logo: "/app/assets/images/homedepot.gif",
            state: "approved"
          },
          {
            title: "HP",
            logo: "/app/assets/images/hp.jpg",
            state: "approved"
          },
          {
            title: "IBM",
            logo: "/app/assets/images/ibm.jpg",
            state: "approved"
          },
          {
            title: "Verizon",
            logo: "/app/assets/images/verizon.gif",
            state: "approved"
          },
          {
            title: "Walmart",
            logo: "/app/assets/images/walmart.gif",
            state: "approved"
          },
        ]
      end

    end
  end
end
