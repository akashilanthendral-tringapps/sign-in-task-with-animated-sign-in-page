sub init()
    print ".............................."
    print "Inside init of leftMarkUpGridListItemComponent"
    print ".............................."
    m.name = m.top.findNode("name")
    m.iconUri = m.top.findNode("iconUri")


end sub

sub setContent()
    print "Inside setContent()"
    m.itemContentValues = m.top.itemContent
    print "m.itemContentValues: "m.itemContentValues
    m.name.text = m.itemContentValues.name
    m.iconUri.uri = m.itemContentValues.iconUri

end sub