require 'json'
require 'linkeddata'
require 'rest-client'
require_relative "builder/version"
require_relative "resource"
require_relative "dataset"
require_relative "distribution"
require_relative "dataservice"
require_relative "catalog"
require_relative "connection"
require_relative "dataservice"


def load_ontology
  unless $g
    $g = RDF::Graph.load("https://www.w3.org/ns/dcat2.ttl")
    RDF::Vocabulary.from_graph($g, url: "http://www.w3.org/ns/dcat", class_name: "DCAT")
  end


  DCAT.each do |t|
    type = t.properties["rdf:type".to_sym]
    #puts "\n\n#{type.to_s}"
    type = [type] unless type.is_a? Array
    next unless type.first.to_s =~ /Property$/
    $stderr.puts "\n\ntype is #{type.first.to_s}"
    $stderr.puts "property is #{t}"
    

    domain = t.properties["rdfs:domain".to_sym]
    puts "domain #{domain}"
    domain = domain.first if domain.is_a? Array
    puts domain
    if domain   # sometimes it wont exist, and then its just resource
      next unless domain =~ /dcat/  # unless its nt part of DCAT at all
    end
    domainclass = ""
    if domain.to_s.match(/#(\w+)/)
      domainclass = "FDP::Builder::#{$1}"
    else 
      domainclass = "FDP::Builder::Resource"
    end
    $stderr.puts "domain Class is #{domainclass}"
    if t.to_s.match(/#(\w+)/)
      $stderr.puts "#{t} matched #{$1}"
      method = $1
    else
      abort "method not identified"
    end

    $stderr.puts "Method is #{method}"

    Kernel.const_get(domainclass).class.send(:define_method, method.to_sym) do
      return "@#{method}".to_sym
    end
    Kernel.const_get(domainclass).class.send(:define_method, "#{method}=".to_sym) do |val|
      "@#{method}".to_sym = val
      return "@#{method}".to_sym
    end
    
  end
    
end
