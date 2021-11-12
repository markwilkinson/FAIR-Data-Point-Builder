CATALOGINIT = = <<END
@prefix dcat: <http://www.w3.org/ns/dcat#> .
@prefix dct: <http://purl.org/dc/terms/> .
@prefix foaf: <http://xmlns.com/foaf/0.1/> .

<> a dcat:Catalog, dcat:Resource ;
    dct:title "test" ;
    dct:hasVersion "1.0" ;
    dct:publisher [ a foaf:Agent ; foaf:name "Example User" ] ;
    dct:isPartOf <%{domain}> .
    
END

DATASETINIT = <<END2
@prefix dcat: <http://www.w3.org/ns/dcat#> .
@prefix dct: <http://purl.org/dc/terms/> .
@prefix foaf: <http://xmlns.com/foaf/0.1/> .

<> a dcat:Dataset, dcat:Resource ;
    dct:title "test" ;
    dct:hasVersion "1.0" ;
    dct:publisher [ a foaf:Agent ; foaf:name "Example User" ] ;
    dcat:theme <http://purl.obolibrary.org/obo/GENEPIO_0001793> ;
    dct:isPartOf <%{catlocation}> .
    
END2

DISTRIBUTIONINIT = <<END3
@prefix dcat: <http://www.w3.org/ns/dcat#> .
@prefix dct: <http://purl.org/dc/terms/> .
@prefix foaf: <http://xmlns.com/foaf/0.1/> .

<> a dcat:Distribution, dcat:Resource ;
    dct:title "test" ;
    dct:hasVersion "1.0" ;
    dct:publisher [ a foaf:Agent ; foaf:name "Example User" ] ;
    dct:isPartOf <%{datalocation}> ;
    dcat:mediaType "text/turtle" .
    
END3