sub init()
    m.top.setFocus(true)
    m.top.observeField("focusedChild", "setFocusToMyList")

    m.logoutButton = m.top.findNode("logoutButton")
    m.playButton = m.top.findNode("playButton")
    
    m.logoutButton.observeField("buttonSelected", "onLogoutButtonSelected")
    m.playButton.observeField("buttonSelected", "onPlayButtonSelected")
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
            if m.playButton.hasFocus()
                m.logoutButton.setFocus(true)
                return true
            end if
        else if key = "left"
            if m.logoutButton.hasFocus()
                m.playButton.setFocus(true)
                return true
            end if
        end if
    return false
    end if
end function