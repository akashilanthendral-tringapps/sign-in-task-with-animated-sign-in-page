sub init()
    m.top.setFocus(true)
    m.top.observeField("focusedChild", "setFocusToMyList")

    ' m.logoutButton = m.top.findNode("logoutButton")
    m.playButton = m.top.findNode("playButton")
    m.leftMarkUpGridList = m.top.findNode("leftMarkUpGridList")
    m.leftMarkUpGridListAnimation = m.top.findNode("leftMarkUpGridListAnimation")
    m.leftMarkUpGridListAnimationWhenUnfocused = m.top.findNode("leftMarkUpGridListAnimationWhenUnfocused")
    
    m.leftMarkUpGridList.observeField("itemFocused", "onMarkUpGridIsFocused")
    ' m.leftMarkUpGridList.observeField("itemUnfocused", "onMarkUpGridIsUnfocused")
    m.leftMarkUpGridList.observeField("itemSelected", "onMarkUpGridSelected")

    ' m.logoutButton.observeField("buttonSelected", "onLogoutButtonSelected")
    m.playButton.observeField("buttonSelected", "onPlayButtonSelected")

    setLeftMarkUpGridItems()
end sub


' sub onMarkUpGridIsUnfocused()
'     print "onMarkUpGridIsUnfocused()"
'     m.leftMarkUpGridList.itemSize = "[ 50, 50 ]"
' end sub

sub onMarkUpGridIsFocused()
    print "onMarkUpGridIsFocused()"
    ' m.leftMarkUpGridListAnimation.control = "start"
    'm.leftMarkUpGridList.itemSize = "[ 180, 50 ]"
end sub

sub onMarkUpGridSelected()
    selectedItemIndex = m.leftMarkUpGridList.itemSelected
    selectedItem = m.leftMarkUpGridList.content.getChild(selectedItemIndex)
    if selectedItem.name = "Sign out"
        onLogoutButtonSelected()
    end if
end sub

sub setLeftMarkUpGridItems()
    print "SETTING setLeftMarkUpGridItems"
    markUpGridItemContents = [
        {
            "name": "Home",
            "iconUri": "pkg:/images/separated/homeIconColored.png"
        },
        {
            "name": "Search",
            "iconUri": "pkg:/images/separated/searchIconBlue2.png"
        },
        {
            "name": "Profile",
            "iconUri": "pkg:/images/separated/profileIcon.png"
        },
        {
            "name": "Live",
            "iconUri": "pkg:/images/separated/liveIcon.png"
        },
        {
            "name": "Sign out",
            "iconUri": "pkg:/images/separated/signoutIcon.png"
        }
    ]


    parentContent = CreateObject("roSGNode", "contentNode")

    for each item in markUpGridItemContents
        childContent = parentContent.createChild("leftMarkUpGridContent")
        childContent.iconUri = item.iconUri
        childContent.name = item.name
    end for

    m.leftMarkUpGridList.content = parentContent
end sub

sub setFocusToMyList()

    if m.top.hasFocus()
        m.playButton.setFocus(true)
    end if

end sub

sub onLogoutButtonSelected()
    m.top.getScene().deleteBackStackArray = true
    m.top.getScene().logOut = true
    m.top.getScene().compToPush = "loginComponent"

end sub

sub onPlayButtonSelected()

    m.top.getScene().compToPush = "videoComponent"

end sub

function onKeyEvent(key as string, press as boolean) as boolean
    if press
        if key = "right"
            ' if m.playButton.hasFocus()
            '     m.logoutButton.setFocus(true)
            '     return true
            if m.leftMarkUpGridList.hasFocus()
                m.leftMarkUpGridListAnimationWhenUnfocused.control = "start"
                ' m.leftMarkUpGridList.itemSize = "[ 50, 50 ]"
                m.playButton.setFocus(true)
                return true
            end if
        else if key = "left"
            ' if m.logoutButton.hasFocus()
            '     m.playButton.setFocus(true)
            '     return true
            if m.playButton.hasFocus()
                m.leftMarkUpGridListAnimation.control = "start"
                m.leftMarkUpGridList.setFocus(true)
            end if
        end if
    return false
    end if
end function