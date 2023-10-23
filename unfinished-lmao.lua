--I know this code is bad but it's like almost 2 am and i don't care
--pause menu ui lib made by tornvrc
local uis = game:GetService("UserInputService")
local guiapi = {
    SwitchToPage = function(page)
        page.Show()

    end;
    AddPage = function(pagename, title, issubmenu)
        local pagedupe = game.CoreGui.RobloxGui.SettingsClippingShield.SettingsShield.MenuContainer.PageViewClipper.PageView.PageViewInnerFrame.Players:Clone()
        pagedupe.Name = pagename .. "_CUSTOMPAGE"
        pagedupe.Parent = game.CoreGui.RobloxGui.SettingsClippingShield.SettingsShield.MenuContainer.PageViewClipper.PageView.PageViewInnerFrame
        pagedupe.Visible = false
        
        if not issubmenu then
            local tabdupe = game.CoreGui.RobloxGui.SettingsClippingShield.SettingsShield.MenuContainer.HubBar.HubBarContainer.PlayersTab:Clone()
            tabdupe.Parent = game.CoreGui.RobloxGui.SettingsClippingShield.SettingsShield.MenuContainer.HubBar.HubBarContainer
            tabdupe.Name = pagename .. "_TABBUTTON"
            tabdupe.TabLabel.Title.Text = title
            tabdupe.TabLabel.Title.TextTransparency = 0.5
            tabdupe.TabLabel.Icon.ImageTransparency = 0.5
            tabdupe.TabSelection.Visible = false
            uis.InputBegan:Connect(function(input, ignore)
                if input.UserInputType == Enum.UserInputType.Keyboard then
                    if input.KeyCode == Enum.KeyCode.Escape then
                        pagedupe.Visible = false
                        tabdupe.TabLabel.Title.TextTransparency = 0.5
            tabdupe.TabLabel.Icon.ImageTransparency = 0.5
            tabdupe.TabSelection.Visible = false
                    end
                end
        end)
            tabdupe.MouseButton1Click:Connect(function()
                for i,v in ipairs(game.CoreGui.RobloxGui.SettingsClippingShield.SettingsShield.MenuContainer.PageViewClipper.PageView.PageViewInnerFrame:GetChildren()) do
                    if v:IsA("Frame") then
                        v.Visible = false
                    end
                end
                for i,v in ipairs(game.CoreGui.RobloxGui.SettingsClippingShield.SettingsShield.MenuContainer.HubBar.HubBarContainer:GetChildren()) do
                    if v:IsA("TextButton") and v.Name ~= tabdupe.Name then
                        v.TabSelection.Visible = false
                        v.TabLabel.Title.TextTransparency = 0.5
                        v.TabLabel.Icon.ImageTransparency = 0.5
                        v.MouseButton1Click:Connect(
                            function()
                                pagedupe.Visible = false
                                tabdupe.TabLabel.Title.TextTransparency = 0.5
                tabdupe.TabLabel.Icon.ImageTransparency = 0.5
                tabdupe.TabSelection.Visible = false
                            end
                        )
                    end
                end
                tabdupe.TabLabel.Title.TextTransparency = 0
                tabdupe.TabLabel.Icon.ImageTransparency = 0
                pagedupe.Visible = true
                pagedupe.Position = UDim2.fromScale(0, 0)
                tabdupe.TabSelection.Visible = true
            end)
        end
        for i,v in ipairs(pagedupe:GetDescendants()) do
            if v.ClassName ~= "UIPadding" or v.ClassName ~= "UIListLayout" then
                v:Destroy()
            end
        end
        --Copy back over the ui objects that for some reason get deleted by our little sanity check above this
        local paddingclone = game.CoreGui.RobloxGui.SettingsClippingShield.SettingsShield.MenuContainer.PageViewClipper.PageView.PageViewInnerFrame.Players.UIPadding:Clone()
        local layoutclone = game.CoreGui.RobloxGui.SettingsClippingShield.SettingsShield.MenuContainer.PageViewClipper.PageView.PageViewInnerFrame.Players.RowListLayout:Clone()
        paddingclone.Parent = pagedupe
        layoutclone.Parent = pagedupe
        local pagefuncs = {
            AddButton = function(buttontext, callback)
                local btnclone = game.CoreGui.RobloxGui.SettingsClippingShield.SettingsShield.MenuContainer.PageViewClipper.PageView.PageViewInnerFrame.Players.ImageButton:Clone()
                btnclone.Parent = pagedupe
                btnclone.TextLabel.Text = buttontext
                btnclone.MouseButton1Click:Connect(function()
                    callback()
                end)
            end;
            AddToggle = function(toggletext, callback)
                local btnclone = game.CoreGui.RobloxGui.SettingsClippingShield.SettingsShield.MenuContainer.PageViewClipper.PageView.PageViewInnerFrame.Players.ImageButton:Clone()
                btnclone.Parent = pagedupe
                localbool = false
                btnclone.TextLabel.Text = toggletext .. " (Off)"
                btnclone.MouseButton1Click:Connect(function()
                    localbool = not localbool
                        if localbool then
                            btnclone.TextLabel.Text = toggletext .. " (On)"
                            
                        else
                            btnclone.TextLabel.Text = toggletext .. " (Off)"
                            
                        end
                    callback(localbool)
                end)
            end;
            Show = function()
                if issubmenu then
                    for i,v in ipairs(game.CoreGui.RobloxGui.SettingsClippingShield.SettingsShield.MenuContainer.HubBar.HubBarContainer:GetChildren()) do
                        if v:IsA("TextButton") then
                            v.TabSelection.Visible = false
                            v.TabLabel.Title.TextTransparency = 0.5
                            v.TabLabel.Icon.ImageTransparency = 0.5
                        end
                    end
                    for i,v in ipairs(game.CoreGui.RobloxGui.SettingsClippingShield.SettingsShield.MenuContainer.PageViewClipper.PageView.PageViewInnerFrame:GetChildren()) do
                        if v:IsA("Frame") then
                            v.Visible = false
                        end
                    end

                    pagedupe.Visible = true
                    pagedupe.Position = UDim2.fromScale(0, 0)
                else
                    for i,v in ipairs(game.CoreGui.RobloxGui.SettingsClippingShield.SettingsShield.MenuContainer.PageViewClipper.PageView.PageViewInnerFrame:GetChildren()) do
                        if v:IsA("Frame") then
                        v.Visible = false
                    end
                 end
                for i,v in ipairs(game.CoreGui.RobloxGui.SettingsClippingShield.SettingsShield.MenuContainer.HubBar.HubBarContainer:GetChildren()) do
                    if v:IsA("TextButton") and v.Name ~= tabdupe.Name then
                        v.TabSelection.Visible = false
                        v.TabLabel.Title.TextTransparency = 0.5
                        v.TabLabel.Icon.ImageTransparency = 0.5
                        v.MouseButton1Click:Connect(
                            function()
                                pagedupe.Visible = false
                                tabdupe.TabLabel.Title.TextTransparency = 0.5
                tabdupe.TabLabel.Icon.ImageTransparency = 0.5
                tabdupe.TabSelection.Visible = false
                            end
                        )
                    end
                end
                tabdupe.TabLabel.Title.TextTransparency = 0
                tabdupe.TabLabel.Icon.ImageTransparency = 0
                pagedupe.Visible = true
                pagedupe.Position = UDim2.fromScale(0, 0)
                tabdupe.TabSelection.Visible = true
                end
            end;
        }
        print("Successfully created page: " .. title)
        return pagefuncs
    end
}
local examplepage = guiapi.AddPage("TestPage", "Zulu Client", false)
local examplesubmenu = guiapi.AddPage("TestSubPage", "", true)
local otherexamplepage = guiapi.AddPage("testpage2", "Another page test", false)
examplepage.AddButton("Test 123", function()
    print("Hello world!")
end)
examplepage.AddToggle("Test toggle", function(bool)
    print("Test toggle clicked " .. tostring(bool))
end)
examplesubmenu.AddButton("Back", function()
    examplepage.Show()
end)
examplepage.AddButton("Submenu Test", function()
    examplesubmenu.Show()
end)
examplepage.AddButton("Non-Submenu test", function()
    otherexamplepage.Show()
end)
print("initialized.")
return guiapi
