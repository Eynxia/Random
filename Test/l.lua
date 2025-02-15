--[=[
 d888b  db    db d888888b      .d888b.      db      db    db  .d8b.  
88' Y8b 88    88   `88'        VP  `8D      88      88    88 d8' `8b 
88      88    88    88            odD'      88      88    88 88ooo88 
88  ooo 88    88    88          .88'        88      88    88 88~~~88 
88. ~8~ 88b  d88   .88.        j88.         88booo. 88b  d88 88   88    @uniquadev
 Y888P  ~Y8888P' Y888888P      888888D      Y88888P ~Y8888P' YP   YP  CONVERTER 
]=]

-- Instances: 82 | Scripts: 1 | Modules: 0 | Tags: 3
local CollectionService = game:GetService("CollectionService");
local G2L = {};

-- StarterGui.UI
G2L["1"] = Instance.new("ScreenGui", game.CoreGui);
G2L["1"]["IgnoreGuiInset"] = true;
G2L["1"]["ScreenInsets"] = Enum.ScreenInsets.DeviceSafeInsets;
G2L["1"]["Name"] = [[UI]];
G2L["1"]["ZIndexBehavior"] = Enum.ZIndexBehavior.Sibling;


-- StarterGui.UI.Main
G2L["2"] = Instance.new("Frame", G2L["1"]);
G2L["2"]["BorderSizePixel"] = 0;
G2L["2"]["BackgroundColor3"] = Color3.fromRGB(39, 39, 39);
G2L["2"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
G2L["2"]["ClipsDescendants"] = true;
G2L["2"]["Size"] = UDim2.new(0.3, 0, 0.6, 0);
G2L["2"]["Position"] = UDim2.new(0.5, 0, 0.50622, 0);
G2L["2"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["2"]["Name"] = [[Main]];

Instance.new("UIDragDetector").Parent = G2L["2"]

-- StarterGui.UI.Main.UIGradient
G2L["3"] = Instance.new("UIGradient", G2L["2"]);
G2L["3"]["Rotation"] = 90;
G2L["3"]["Color"] = ColorSequence.new{ColorSequenceKeypoint.new(0.000, Color3.fromRGB(255, 255, 255)),ColorSequenceKeypoint.new(0.734, Color3.fromRGB(10, 10, 10)),ColorSequenceKeypoint.new(1.000, Color3.fromRGB(0, 0, 0))};


-- StarterGui.UI.Main.UICorner
G2L["4"] = Instance.new("UICorner", G2L["2"]);
G2L["4"]["CornerRadius"] = UDim.new(0.01, 0);


-- StarterGui.UI.Main.UIStroke
G2L["5"] = Instance.new("UIStroke", G2L["2"]);
G2L["5"]["Thickness"] = 2;
G2L["5"]["Color"] = Color3.fromRGB(61, 113, 255);


-- StarterGui.UI.Main.Inner
G2L["6"] = Instance.new("Folder", G2L["2"]);
G2L["6"]["Name"] = [[Inner]];


-- StarterGui.UI.Main.Inner.Topbar
G2L["7"] = Instance.new("Frame", G2L["6"]);
G2L["7"]["BorderSizePixel"] = 0;
G2L["7"]["BackgroundColor3"] = Color3.fromRGB(36, 36, 36);
G2L["7"]["Size"] = UDim2.new(1, 0, 0.06047, 0);
G2L["7"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["7"]["Name"] = [[Topbar]];


-- StarterGui.UI.Main.Inner.Topbar.UIGradient
G2L["8"] = Instance.new("UIGradient", G2L["7"]);
G2L["8"]["Rotation"] = 90;
G2L["8"]["Color"] = ColorSequence.new{ColorSequenceKeypoint.new(0.000, Color3.fromRGB(255, 255, 255)),ColorSequenceKeypoint.new(1.000, Color3.fromRGB(0, 0, 0))};


-- StarterGui.UI.Main.Inner.Topbar.UICorner
G2L["9"] = Instance.new("UICorner", G2L["7"]);
G2L["9"]["CornerRadius"] = UDim.new(0.2, 0);


-- StarterGui.UI.Main.Inner.Topbar.Scroller
G2L["a"] = Instance.new("Folder", G2L["7"]);
G2L["a"]["Name"] = [[Scroller]];


-- StarterGui.UI.Main.Inner.Topbar.Scroller.Sections
G2L["b"] = Instance.new("ScrollingFrame", G2L["a"]);
G2L["b"]["Active"] = true;
G2L["b"]["ScrollingDirection"] = Enum.ScrollingDirection.X;
G2L["b"]["BorderSizePixel"] = 0;
G2L["b"]["CanvasSize"] = UDim2.new(0, 692, 0, 0);
G2L["b"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["b"]["Name"] = [[Sections]];
G2L["b"]["AutomaticCanvasSize"] = Enum.AutomaticSize.XY;
G2L["b"]["Size"] = UDim2.new(1, 0, 1, 0);
G2L["b"]["ScrollBarImageColor3"] = Color3.fromRGB(0, 0, 0);
G2L["b"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["b"]["ScrollBarThickness"] = 2;
G2L["b"]["BackgroundTransparency"] = 1;


-- StarterGui.UI.Main.Inner.Topbar.Scroller.Sections.UIListLayout
G2L["c"] = Instance.new("UIListLayout", G2L["b"]);
G2L["c"]["Padding"] = UDim.new(0.025, 0);
G2L["c"]["SortOrder"] = Enum.SortOrder.LayoutOrder;
G2L["c"]["FillDirection"] = Enum.FillDirection.Horizontal;


-- StarterGui.UI.Main.Inner.Topbar.Scroller.Sections.UIPadding
G2L["d"] = Instance.new("UIPadding", G2L["b"]);
G2L["d"]["PaddingTop"] = UDim.new(0.2, 0);
G2L["d"]["PaddingLeft"] = UDim.new(0.015, 0);


-- StarterGui.UI.Main.Inner.Topbar.Scroller.Sections.Placeholder
G2L["e"] = Instance.new("Frame", G2L["b"]);
G2L["e"]["BorderSizePixel"] = 0;
G2L["e"]["BackgroundColor3"] = Color3.fromRGB(41, 41, 41);
G2L["e"]["Size"] = UDim2.new(0.14, 0, 0.57, 0);
G2L["e"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["e"]["Name"] = [[Placeholder]];


-- StarterGui.UI.Main.Inner.Topbar.Scroller.Sections.Placeholder.UICorner
G2L["f"] = Instance.new("UICorner", G2L["e"]);
G2L["f"]["CornerRadius"] = UDim.new(0.25, 0);


-- StarterGui.UI.Main.Inner.Topbar.Scroller.Sections.Placeholder.TextLabel
G2L["10"] = Instance.new("TextLabel", G2L["e"]);
G2L["10"]["TextWrapped"] = true;
G2L["10"]["BorderSizePixel"] = 0;
G2L["10"]["TextScaled"] = true;
G2L["10"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["10"]["TextSize"] = 14;
G2L["10"]["FontFace"] = Font.new([[rbxasset://fonts/families/GothamSSm.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal);
G2L["10"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
G2L["10"]["BackgroundTransparency"] = 1;
G2L["10"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
G2L["10"]["Size"] = UDim2.new(1, 0, 0.7, 0);
G2L["10"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["10"]["Text"] = [[Menu]];
G2L["10"]["Position"] = UDim2.new(0.5, 0, 0.5, 0);


-- StarterGui.UI.Main.Inner.Topbar.Scroller.Sections.Placeholder.UIGradient
G2L["11"] = Instance.new("UIGradient", G2L["e"]);
G2L["11"]["Rotation"] = 90;
G2L["11"]["Color"] = ColorSequence.new{ColorSequenceKeypoint.new(0.000, Color3.fromRGB(255, 255, 255)),ColorSequenceKeypoint.new(1.000, Color3.fromRGB(0, 0, 0))};


-- StarterGui.UI.Main.Inner.Topbar.Scroller.Sections.Placeholder.UIStroke
G2L["12"] = Instance.new("UIStroke", G2L["e"]);
G2L["12"]["Transparency"] = 0.3;
G2L["12"]["Color"] = Color3.fromRGB(156, 156, 156);


-- StarterGui.UI.Main.Inner.Topbar.Scroller.Sections.Placeholder.TextButton
G2L["13"] = Instance.new("TextButton", G2L["e"]);
G2L["13"]["BorderSizePixel"] = 0;
G2L["13"]["TextSize"] = 14;
G2L["13"]["TextColor3"] = Color3.fromRGB(0, 0, 0);
G2L["13"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["13"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["13"]["Size"] = UDim2.new(1, 0, 1, 0);
G2L["13"]["BackgroundTransparency"] = 1;
G2L["13"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["13"]["Text"] = [[]];


-- StarterGui.UI.Main.Inner.Divider
G2L["14"] = Instance.new("Frame", G2L["6"]);
G2L["14"]["BorderSizePixel"] = 0;
G2L["14"]["BackgroundColor3"] = Color3.fromRGB(101, 101, 101);
G2L["14"]["Size"] = UDim2.new(1, 0, 0.00184, 0);
G2L["14"]["Position"] = UDim2.new(0, 0, 0.05894, 0);
G2L["14"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["14"]["Name"] = [[Divider]];


-- StarterGui.UI.Main.Possible Sections
G2L["15"] = Instance.new("Folder", G2L["2"]);
G2L["15"]["Name"] = [[Possible Sections]];


-- StarterGui.UI.Main.Possible Sections.Sect_2
G2L["16"] = Instance.new("CanvasGroup", G2L["15"]);
G2L["16"]["Visible"] = false;
G2L["16"]["BorderSizePixel"] = 0;
G2L["16"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["16"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
G2L["16"]["Size"] = UDim2.new(0.446, 0, 0.87, 0);
G2L["16"]["Position"] = UDim2.new(0.761, 0, 0.528, 0);
G2L["16"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["16"]["Name"] = [[Sect_2]];
G2L["16"]["BackgroundTransparency"] = 1;
-- Attributes
G2L["16"]:SetAttribute([[Size]], UDim2.new(0.446, 0, 0.87, 0));

-- Tags
CollectionService:AddTag(G2L["16"], [[Sect_2]]);

-- StarterGui.UI.Main.Possible Sections.Sect_2.Sect
G2L["17"] = Instance.new("Frame", G2L["16"]);
G2L["17"]["BorderSizePixel"] = 0;
G2L["17"]["BackgroundColor3"] = Color3.fromRGB(51, 51, 51);
G2L["17"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
G2L["17"]["Size"] = UDim2.new(0.975, 0, 0.975, 0);
G2L["17"]["Position"] = UDim2.new(0.5, 0, 0.5, 0);
G2L["17"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["17"]["Name"] = [[Sect]];


-- StarterGui.UI.Main.Possible Sections.Sect_2.Sect.UIStroke
G2L["18"] = Instance.new("UIStroke", G2L["17"]);
G2L["18"]["Color"] = Color3.fromRGB(61, 113, 255);


-- StarterGui.UI.Main.Possible Sections.Sect_2.Sect.Folder
G2L["19"] = Instance.new("Folder", G2L["17"]);



-- StarterGui.UI.Main.Possible Sections.Sect_2.Sect.Folder.TextLabel
G2L["1a"] = Instance.new("TextLabel", G2L["19"]);
G2L["1a"]["TextWrapped"] = true;
G2L["1a"]["BorderSizePixel"] = 0;
G2L["1a"]["TextScaled"] = true;
G2L["1a"]["BackgroundColor3"] = Color3.fromRGB(156, 156, 156);
G2L["1a"]["TextSize"] = 14;
G2L["1a"]["FontFace"] = Font.new([[rbxasset://fonts/families/GothamSSm.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["1a"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
G2L["1a"]["BackgroundTransparency"] = 1;
G2L["1a"]["Size"] = UDim2.new(1, 0, 0.04753, 0);
G2L["1a"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["1a"]["Text"] = [[SECTOR NAME]];
G2L["1a"]["Position"] = UDim2.new(0, 0, 0.01205, 0);


-- StarterGui.UI.Main.Possible Sections.Sect_2.Sect.Folder.Frame
G2L["1b"] = Instance.new("Frame", G2L["19"]);
G2L["1b"]["BorderSizePixel"] = 0;
G2L["1b"]["BackgroundColor3"] = Color3.fromRGB(156, 156, 156);
G2L["1b"]["Size"] = UDim2.new(1, 0, 0.002, 0);
G2L["1b"]["Position"] = UDim2.new(0, 0, 0.06177, 0);
G2L["1b"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);


-- StarterGui.UI.Main.Possible Sections.Sect_2.Sect.Folder.Frame.UIGradient
G2L["1c"] = Instance.new("UIGradient", G2L["1b"]);
G2L["1c"]["Transparency"] = NumberSequence.new{NumberSequenceKeypoint.new(0.000, 1),NumberSequenceKeypoint.new(0.500, 0.5),NumberSequenceKeypoint.new(1.000, 1)};


-- StarterGui.UI.Main.Possible Sections.Sect_2.Sect.Scroller
G2L["1d"] = Instance.new("Folder", G2L["17"]);
G2L["1d"]["Name"] = [[Scroller]];


-- StarterGui.UI.Main.Possible Sections.Sect_2.Sect.Scroller.ScrollingFrame
G2L["1e"] = Instance.new("ScrollingFrame", G2L["1d"]);
G2L["1e"]["Active"] = true;
G2L["1e"]["BorderSizePixel"] = 0;
G2L["1e"]["CanvasSize"] = UDim2.new(0, 0, 0, 0);
G2L["1e"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["1e"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
G2L["1e"]["AutomaticCanvasSize"] = Enum.AutomaticSize.XY;
G2L["1e"]["Size"] = UDim2.new(0.955, 0, 0.89173, 0);
G2L["1e"]["ScrollBarImageColor3"] = Color3.fromRGB(0, 0, 0);
G2L["1e"]["Position"] = UDim2.new(0.5, 0, 0.52797, 0);
G2L["1e"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["1e"]["ScrollBarThickness"] = 2;
G2L["1e"]["BackgroundTransparency"] = 1;


-- StarterGui.UI.Main.Possible Sections.Sect_2.Sect.Scroller.ScrollingFrame.UIListLayout
G2L["1f"] = Instance.new("UIListLayout", G2L["1e"]);
G2L["1f"]["Padding"] = UDim.new(0.025, 0);
G2L["1f"]["SortOrder"] = Enum.SortOrder.LayoutOrder;


-- StarterGui.UI.Main.Possible Sections.Sect_2.Sect.UIGradient
G2L["20"] = Instance.new("UIGradient", G2L["17"]);
G2L["20"]["Rotation"] = 90;
G2L["20"]["Color"] = ColorSequence.new{ColorSequenceKeypoint.new(0.000, Color3.fromRGB(255, 255, 255)),ColorSequenceKeypoint.new(0.721, Color3.fromRGB(10, 10, 10)),ColorSequenceKeypoint.new(1.000, Color3.fromRGB(0, 0, 0))};


-- StarterGui.UI.Main.Possible Sections.Sect_2.Sect.UICorner
G2L["21"] = Instance.new("UICorner", G2L["17"]);
G2L["21"]["CornerRadius"] = UDim.new(0.025, 0);


-- StarterGui.UI.Main.Possible Sections.Sect_1
G2L["22"] = Instance.new("CanvasGroup", G2L["15"]);
G2L["22"]["Visible"] = false;
G2L["22"]["BorderSizePixel"] = 0;
G2L["22"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["22"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
G2L["22"]["Size"] = UDim2.new(0.446, 0, 0.59, 0);
G2L["22"]["Position"] = UDim2.new(0.252, 0, 0.388, 0);
G2L["22"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["22"]["Name"] = [[Sect_1]];
G2L["22"]["BackgroundTransparency"] = 1;
-- Attributes
G2L["22"]:SetAttribute([[Size]], UDim2.new(0.446, 0, 0.59, 0));

-- Tags
CollectionService:AddTag(G2L["22"], [[Sect_1]]);

-- StarterGui.UI.Main.Possible Sections.Sect_1.Sect
G2L["23"] = Instance.new("Frame", G2L["22"]);
G2L["23"]["BorderSizePixel"] = 0;
G2L["23"]["BackgroundColor3"] = Color3.fromRGB(51, 51, 51);
G2L["23"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
G2L["23"]["Size"] = UDim2.new(0.975, 0, 0.975, 0);
G2L["23"]["Position"] = UDim2.new(0.5, 0, 0.5, 0);
G2L["23"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["23"]["Name"] = [[Sect]];


-- StarterGui.UI.Main.Possible Sections.Sect_1.Sect.UIStroke
G2L["24"] = Instance.new("UIStroke", G2L["23"]);
G2L["24"]["Color"] = Color3.fromRGB(61, 113, 255);


-- StarterGui.UI.Main.Possible Sections.Sect_1.Sect.Folder
G2L["25"] = Instance.new("Folder", G2L["23"]);



-- StarterGui.UI.Main.Possible Sections.Sect_1.Sect.Folder.TextLabel
G2L["26"] = Instance.new("TextLabel", G2L["25"]);
G2L["26"]["TextWrapped"] = true;
G2L["26"]["BorderSizePixel"] = 0;
G2L["26"]["TextScaled"] = true;
G2L["26"]["BackgroundColor3"] = Color3.fromRGB(156, 156, 156);
G2L["26"]["TextSize"] = 14;
G2L["26"]["FontFace"] = Font.new([[rbxasset://fonts/families/GothamSSm.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["26"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
G2L["26"]["BackgroundTransparency"] = 1;
G2L["26"]["Size"] = UDim2.new(1, 0, 0.065, 0);
G2L["26"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["26"]["Text"] = [[SECTOR NAME]];
G2L["26"]["Position"] = UDim2.new(0, 0, 0.02, 0);


-- StarterGui.UI.Main.Possible Sections.Sect_1.Sect.Folder.Frame
G2L["27"] = Instance.new("Frame", G2L["25"]);
G2L["27"]["BorderSizePixel"] = 0;
G2L["27"]["BackgroundColor3"] = Color3.fromRGB(156, 156, 156);
G2L["27"]["Size"] = UDim2.new(1, 0, 0.004, 0);
G2L["27"]["Position"] = UDim2.new(0, 0, 0.09384, 0);
G2L["27"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);


-- StarterGui.UI.Main.Possible Sections.Sect_1.Sect.Folder.Frame.UIGradient
G2L["28"] = Instance.new("UIGradient", G2L["27"]);
G2L["28"]["Transparency"] = NumberSequence.new{NumberSequenceKeypoint.new(0.000, 1),NumberSequenceKeypoint.new(0.500, 0.5),NumberSequenceKeypoint.new(1.000, 1)};


-- StarterGui.UI.Main.Possible Sections.Sect_1.Sect.Scroller
G2L["29"] = Instance.new("Folder", G2L["23"]);
G2L["29"]["Name"] = [[Scroller]];


-- StarterGui.UI.Main.Possible Sections.Sect_1.Sect.Scroller.ScrollingFrame
G2L["2a"] = Instance.new("ScrollingFrame", G2L["29"]);
G2L["2a"]["Active"] = true;
G2L["2a"]["BorderSizePixel"] = 0;
G2L["2a"]["CanvasSize"] = UDim2.new(0, 0, 0, 0);
G2L["2a"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["2a"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
G2L["2a"]["AutomaticCanvasSize"] = Enum.AutomaticSize.XY;
G2L["2a"]["Size"] = UDim2.new(0.955, 0, 0.85596, 0);
G2L["2a"]["ScrollBarImageColor3"] = Color3.fromRGB(0, 0, 0);
G2L["2a"]["Position"] = UDim2.new(0.5, 0, 0.54586, 0);
G2L["2a"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["2a"]["ScrollBarThickness"] = 2;
G2L["2a"]["BackgroundTransparency"] = 1;


-- StarterGui.UI.Main.Possible Sections.Sect_1.Sect.Scroller.ScrollingFrame.UIListLayout
G2L["2b"] = Instance.new("UIListLayout", G2L["2a"]);
G2L["2b"]["Padding"] = UDim.new(0.025, 0);
G2L["2b"]["SortOrder"] = Enum.SortOrder.LayoutOrder;


-- StarterGui.UI.Main.Possible Sections.Sect_1.Sect.UIGradient
G2L["2c"] = Instance.new("UIGradient", G2L["23"]);
G2L["2c"]["Rotation"] = 90;
G2L["2c"]["Color"] = ColorSequence.new{ColorSequenceKeypoint.new(0.000, Color3.fromRGB(255, 255, 255)),ColorSequenceKeypoint.new(0.734, Color3.fromRGB(10, 10, 10)),ColorSequenceKeypoint.new(1.000, Color3.fromRGB(0, 0, 0))};


-- StarterGui.UI.Main.Possible Sections.Sect_1.Sect.UICorner
G2L["2d"] = Instance.new("UICorner", G2L["23"]);
G2L["2d"]["CornerRadius"] = UDim.new(0.025, 0);


-- StarterGui.UI.Main.Possible Sections.Sect_3
G2L["2e"] = Instance.new("CanvasGroup", G2L["15"]);
G2L["2e"]["Visible"] = false;
G2L["2e"]["ZIndex"] = 0;
G2L["2e"]["BorderSizePixel"] = 0;
G2L["2e"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["2e"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
G2L["2e"]["Size"] = UDim2.new(0.446, 0, 0.25717, 0);
G2L["2e"]["Position"] = UDim2.new(0.252, 0, 0.82206, 0);
G2L["2e"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["2e"]["Name"] = [[Sect_3]];
G2L["2e"]["BackgroundTransparency"] = 1;
-- Attributes
G2L["2e"]:SetAttribute([[Size]], UDim2.new(0.446, 0, 0.257, 0));

-- Tags
CollectionService:AddTag(G2L["2e"], [[Sect_3]]);

-- StarterGui.UI.Main.Possible Sections.Sect_3.Sect
G2L["2f"] = Instance.new("Frame", G2L["2e"]);
G2L["2f"]["BorderSizePixel"] = 0;
G2L["2f"]["BackgroundColor3"] = Color3.fromRGB(51, 51, 51);
G2L["2f"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
G2L["2f"]["Size"] = UDim2.new(0.975, 0, 0.975, 0);
G2L["2f"]["Position"] = UDim2.new(0.5, 0, 0.5, 0);
G2L["2f"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["2f"]["Name"] = [[Sect]];


-- StarterGui.UI.Main.Possible Sections.Sect_3.Sect.UICorner
G2L["30"] = Instance.new("UICorner", G2L["2f"]);
G2L["30"]["CornerRadius"] = UDim.new(0.025, 0);


-- StarterGui.UI.Main.Possible Sections.Sect_3.Sect.UIStroke
G2L["31"] = Instance.new("UIStroke", G2L["2f"]);
G2L["31"]["Color"] = Color3.fromRGB(61, 113, 255);


-- StarterGui.UI.Main.Possible Sections.Sect_3.Sect.Folder
G2L["32"] = Instance.new("Folder", G2L["2f"]);



-- StarterGui.UI.Main.Possible Sections.Sect_3.Sect.Folder.TextLabel
G2L["33"] = Instance.new("TextLabel", G2L["32"]);
G2L["33"]["TextWrapped"] = true;
G2L["33"]["BorderSizePixel"] = 0;
G2L["33"]["TextScaled"] = true;
G2L["33"]["BackgroundColor3"] = Color3.fromRGB(156, 156, 156);
G2L["33"]["TextSize"] = 14;
G2L["33"]["FontFace"] = Font.new([[rbxasset://fonts/families/GothamSSm.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["33"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
G2L["33"]["BackgroundTransparency"] = 1;
G2L["33"]["Size"] = UDim2.new(1, 0, 0.1292, 0);
G2L["33"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["33"]["Text"] = [[SECTOR NAME]];
G2L["33"]["Position"] = UDim2.new(0, 0, 0.01205, 0);


-- StarterGui.UI.Main.Possible Sections.Sect_3.Sect.Folder.Frame
G2L["34"] = Instance.new("Frame", G2L["32"]);
G2L["34"]["BorderSizePixel"] = 0;
G2L["34"]["BackgroundColor3"] = Color3.fromRGB(156, 156, 156);
G2L["34"]["Size"] = UDim2.new(1, 0, 0.01087, 0);
G2L["34"]["Position"] = UDim2.new(0, 0, 0.14721, 0);
G2L["34"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);


-- StarterGui.UI.Main.Possible Sections.Sect_3.Sect.Folder.Frame.UIGradient
G2L["35"] = Instance.new("UIGradient", G2L["34"]);
G2L["35"]["Transparency"] = NumberSequence.new{NumberSequenceKeypoint.new(0.000, 1),NumberSequenceKeypoint.new(0.500, 0.5),NumberSequenceKeypoint.new(1.000, 1)};


-- StarterGui.UI.Main.Possible Sections.Sect_3.Sect.Scroller
G2L["36"] = Instance.new("Folder", G2L["2f"]);
G2L["36"]["Name"] = [[Scroller]];


-- StarterGui.UI.Main.Possible Sections.Sect_3.Sect.Scroller.ScrollingFrame
G2L["37"] = Instance.new("ScrollingFrame", G2L["36"]);
G2L["37"]["Active"] = true;
G2L["37"]["ZIndex"] = 213;
G2L["37"]["BorderSizePixel"] = 0;
G2L["37"]["CanvasSize"] = UDim2.new(0, 0, 0, 0);
G2L["37"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["37"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
G2L["37"]["AutomaticCanvasSize"] = Enum.AutomaticSize.XY;
G2L["37"]["Size"] = UDim2.new(0.955, 0, 0.80059, 0);
G2L["37"]["ScrollBarImageColor3"] = Color3.fromRGB(0, 0, 0);
G2L["37"]["Position"] = UDim2.new(0.5, 0, 0.58, 0);
G2L["37"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["37"]["ScrollBarThickness"] = 2;
G2L["37"]["BackgroundTransparency"] = 1;


-- StarterGui.UI.Main.Possible Sections.Sect_3.Sect.Scroller.ScrollingFrame.UIListLayout
G2L["38"] = Instance.new("UIListLayout", G2L["37"]);
G2L["38"]["Padding"] = UDim.new(0.025, 0);
G2L["38"]["SortOrder"] = Enum.SortOrder.LayoutOrder;


-- StarterGui.UI.Main.Possible Sections.Sect_3.Sect.UIGradient
G2L["39"] = Instance.new("UIGradient", G2L["2f"]);
G2L["39"]["Rotation"] = 90;
G2L["39"]["Color"] = ColorSequence.new{ColorSequenceKeypoint.new(0.000, Color3.fromRGB(255, 255, 255)),ColorSequenceKeypoint.new(0.401, Color3.fromRGB(53, 53, 53)),ColorSequenceKeypoint.new(0.663, Color3.fromRGB(10, 10, 10)),ColorSequenceKeypoint.new(1.000, Color3.fromRGB(0, 0, 0))};


-- StarterGui.UI.Main.Possible Buttons
G2L["3a"] = Instance.new("Folder", G2L["2"]);
G2L["3a"]["Name"] = [[Possible Buttons]];


-- StarterGui.UI.Main.Possible Buttons.Basic Button
G2L["3b"] = Instance.new("Frame", G2L["3a"]);
G2L["3b"]["Visible"] = false;
G2L["3b"]["ZIndex"] = 0;
G2L["3b"]["BorderSizePixel"] = 0;
G2L["3b"]["BackgroundColor3"] = Color3.fromRGB(31, 31, 31);
G2L["3b"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
G2L["3b"]["Size"] = UDim2.new(0.82951, 0, 0.06026, 0);
G2L["3b"]["Position"] = UDim2.new(0.41475, 0, 0.03013, 0);
G2L["3b"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["3b"]["Name"] = [[Basic Button]];
-- Attributes
G2L["3b"]:SetAttribute([[Size]], UDim2.new(0.83, 0, 0.06, 0));


-- StarterGui.UI.Main.Possible Buttons.Basic Button.UICorner
G2L["3c"] = Instance.new("UICorner", G2L["3b"]);
G2L["3c"]["CornerRadius"] = UDim.new(0.2, 0);


-- StarterGui.UI.Main.Possible Buttons.Basic Button.Title
G2L["3d"] = Instance.new("TextLabel", G2L["3b"]);
G2L["3d"]["TextWrapped"] = true;
G2L["3d"]["BorderSizePixel"] = 0;
G2L["3d"]["TextScaled"] = true;
G2L["3d"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["3d"]["TextSize"] = 14;
G2L["3d"]["FontFace"] = Font.new([[rbxasset://fonts/families/GothamSSm.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["3d"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
G2L["3d"]["BackgroundTransparency"] = 1;
G2L["3d"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
G2L["3d"]["Size"] = UDim2.new(0.9, 0, 0.85, 0);
G2L["3d"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["3d"]["Text"] = [[Robucks]];
G2L["3d"]["Name"] = [[Title]];
G2L["3d"]["Position"] = UDim2.new(0.5, 0, 0.5, 0);


-- StarterGui.UI.Main.Possible Buttons.Basic Button.UIAspectRatioConstraint
G2L["3e"] = Instance.new("UIAspectRatioConstraint", G2L["3b"]);
G2L["3e"]["AspectRatio"] = 7.04698;
G2L["3e"]["AspectType"] = Enum.AspectType.ScaleWithParentSize;


-- StarterGui.UI.Main.Possible Buttons.Basic Button.Button
G2L["3f"] = Instance.new("TextButton", G2L["3b"]);
G2L["3f"]["BorderSizePixel"] = 0;
G2L["3f"]["TextSize"] = 14;
G2L["3f"]["TextColor3"] = Color3.fromRGB(0, 0, 0);
G2L["3f"]["BackgroundColor3"] = Color3.fromRGB(31, 31, 31);
G2L["3f"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["3f"]["MaxVisibleGraphemes"] = 0;
G2L["3f"]["Size"] = UDim2.new(0.08406, 0, 0.59239, 0);
G2L["3f"]["Name"] = [[Button]];
G2L["3f"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["3f"]["Position"] = UDim2.new(1.04297, 0, 0.17654, 0);


-- StarterGui.UI.Main.Possible Buttons.Basic Button.Button.UIStroke
G2L["40"] = Instance.new("UIStroke", G2L["3f"]);
G2L["40"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border;
G2L["40"]["Color"] = Color3.fromRGB(61, 113, 255);


-- StarterGui.UI.Main.Possible Buttons.Textbox
G2L["41"] = Instance.new("Frame", G2L["3a"]);
G2L["41"]["Visible"] = false;
G2L["41"]["ZIndex"] = 0;
G2L["41"]["BorderSizePixel"] = 0;
G2L["41"]["BackgroundColor3"] = Color3.fromRGB(31, 31, 31);
G2L["41"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
G2L["41"]["Size"] = UDim2.new(0.80816, 0, 0.19286, 0);
G2L["41"]["Position"] = UDim2.new(0.40408, 0, 0.09643, 0);
G2L["41"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["41"]["Name"] = [[Textbox]];
-- Attributes
G2L["41"]:SetAttribute([[Size]], UDim2.new(0.954, 0, 0.185, 0));


-- StarterGui.UI.Main.Possible Buttons.Textbox.UICorner
G2L["42"] = Instance.new("UICorner", G2L["41"]);
G2L["42"]["CornerRadius"] = UDim.new(0.2, 0);


-- StarterGui.UI.Main.Possible Buttons.Textbox.Title
G2L["43"] = Instance.new("TextLabel", G2L["41"]);
G2L["43"]["TextWrapped"] = true;
G2L["43"]["BorderSizePixel"] = 0;
G2L["43"]["TextScaled"] = true;
G2L["43"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["43"]["TextSize"] = 14;
G2L["43"]["FontFace"] = Font.new([[rbxasset://fonts/families/GothamSSm.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["43"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
G2L["43"]["BackgroundTransparency"] = 1;
G2L["43"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
G2L["43"]["Size"] = UDim2.new(0.9, 0, 0.39026, 0);
G2L["43"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["43"]["Text"] = [[Robucks]];
G2L["43"]["Name"] = [[Title]];
G2L["43"]["Position"] = UDim2.new(0.49478, 0, 0.2516, 0);


-- StarterGui.UI.Main.Possible Buttons.Textbox.Frame
G2L["44"] = Instance.new("Frame", G2L["41"]);
G2L["44"]["BorderSizePixel"] = 0;
G2L["44"]["BackgroundColor3"] = Color3.fromRGB(156, 156, 156);
G2L["44"]["Size"] = UDim2.new(1, 0, 0.02, 0);
G2L["44"]["Position"] = UDim2.new(0, 0, 0.46526, 0);
G2L["44"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);


-- StarterGui.UI.Main.Possible Buttons.Textbox.Frame.UIGradient
G2L["45"] = Instance.new("UIGradient", G2L["44"]);
G2L["45"]["Transparency"] = NumberSequence.new{NumberSequenceKeypoint.new(0.000, 1),NumberSequenceKeypoint.new(0.500, 0.5),NumberSequenceKeypoint.new(1.000, 1)};


-- StarterGui.UI.Main.Possible Buttons.Textbox.Button
G2L["46"] = Instance.new("TextButton", G2L["41"]);
G2L["46"]["BorderSizePixel"] = 0;
G2L["46"]["TextSize"] = 14;
G2L["46"]["TextColor3"] = Color3.fromRGB(0, 0, 0);
G2L["46"]["BackgroundColor3"] = Color3.fromRGB(31, 31, 31);
G2L["46"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["46"]["MaxVisibleGraphemes"] = 0;
G2L["46"]["Size"] = UDim2.new(0.08628, 0, 0.24887, 0);
G2L["46"]["Name"] = [[Button]];
G2L["46"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["46"]["Position"] = UDim2.new(1.06747, 0, 0.33986, 0);


-- StarterGui.UI.Main.Possible Buttons.Textbox.Button.UIStroke
G2L["47"] = Instance.new("UIStroke", G2L["46"]);
G2L["47"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border;
G2L["47"]["Color"] = Color3.fromRGB(61, 113, 255);


-- StarterGui.UI.Main.Possible Buttons.Textbox.UIAspectRatioConstraint
G2L["48"] = Instance.new("UIAspectRatioConstraint", G2L["41"]);
G2L["48"]["AspectRatio"] = 2.88426;
G2L["48"]["AspectType"] = Enum.AspectType.ScaleWithParentSize;


-- StarterGui.UI.Main.Possible Buttons.Textbox.TextBox
G2L["49"] = Instance.new("TextBox", G2L["41"]);
G2L["49"]["TextColor3"] = Color3.fromRGB(201, 201, 201);
G2L["49"]["BorderSizePixel"] = 0;
G2L["49"]["TextWrapped"] = true;
G2L["49"]["TextSize"] = 14;
G2L["49"]["TextScaled"] = true;
G2L["49"]["BackgroundColor3"] = Color3.fromRGB(21, 21, 21);
G2L["49"]["FontFace"] = Font.new([[rbxasset://fonts/families/GothamSSm.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal);
G2L["49"]["ClearTextOnFocus"] = false;
G2L["49"]["PlaceholderText"] = [[Enter...]];
G2L["49"]["Size"] = UDim2.new(1, 0, 0.48, 0);
G2L["49"]["Position"] = UDim2.new(-0, 0, 0.52, 0);
G2L["49"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["49"]["Text"] = [[]];


-- StarterGui.UI.Main.Possible Buttons.Textbox.TextBox.UICorner
G2L["4a"] = Instance.new("UICorner", G2L["49"]);
G2L["4a"]["CornerRadius"] = UDim.new(0.3, 0);


-- StarterGui.UI.Main.Possible Buttons.Textbox.Frame
G2L["4b"] = Instance.new("Frame", G2L["41"]);
G2L["4b"]["BorderSizePixel"] = 0;
G2L["4b"]["BackgroundColor3"] = Color3.fromRGB(21, 21, 21);
G2L["4b"]["Size"] = UDim2.new(0.99843, 0, 0.08888, 0);
G2L["4b"]["Position"] = UDim2.new(0, 0, 0.48526, 0);
G2L["4b"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);


-- StarterGui.UI.Main.Handle
G2L["4c"] = Instance.new("LocalScript", G2L["2"]);
G2L["4c"]["Name"] = [[Handle]];


-- StarterGui.UI.Main.Handle.Sound
G2L["4d"] = Instance.new("Sound", G2L["4c"]);
G2L["4d"]["RollOffMode"] = Enum.RollOffMode.InverseTapered;
G2L["4d"]["SoundId"] = [[rbxassetid://12221967]];


-- StarterGui.UI.Main.UIAspectRatioConstraint
G2L["4e"] = Instance.new("UIAspectRatioConstraint", G2L["2"]);
G2L["4e"]["AspectRatio"] = 0.79824;


-- StarterGui.UI.Main.Sectors
G2L["4f"] = Instance.new("Folder", G2L["2"]);
G2L["4f"]["Name"] = [[Sectors]];


-- StarterGui.UI.Main.Sectors.Menu
G2L["50"] = Instance.new("Folder", G2L["4f"]);
G2L["50"]["Name"] = [[Menu]];


-- StarterGui.UI.Main.Current Sector
G2L["51"] = Instance.new("StringValue", G2L["2"]);
G2L["51"]["Name"] = [[Current Sector]];
G2L["51"]["Value"] = [[Menu]];


-- StarterGui.UI.Side
G2L["52"] = Instance.new("Folder", G2L["1"]);
G2L["52"]["Name"] = [[Side]];


-- StarterGui.UI.Main.Handle
local function C_4c()
	local script = G2L["4c"];
	--|| Services ||--

	local TweenService = game:GetService("TweenService")
	local CollectionService = game:GetService("CollectionService")
	local Players = game:GetService("Players")
	local RunService = game:GetService("RunService")

	--|| Other ||--

	local Client = Players.LocalPlayer

	local _main = script.Parent

	local Possible_Buttons = _main:WaitForChild("Possible Buttons")
	local Possible_Sections = _main:WaitForChild("Possible Sections")

	local Section_1:CanvasGroup = Possible_Sections:WaitForChild("Sect_1")
	local Section_2:CanvasGroup = Possible_Sections:WaitForChild("Sect_2")
	local Section_3:CanvasGroup = Possible_Sections:WaitForChild("Sect_3")

	local Section_1Size = Section_1.Size
	local Section_2Size = Section_2.Size
	local Section_3Size = Section_3.Size

	local BasicButtonType = Possible_Buttons:WaitForChild("Basic Button")
	local Textbox = Possible_Buttons:WaitForChild("Textbox")

	Section_1.Size = UDim2.new(0,0,Section_1Size.Y.Scale,0)
	Section_2.Size = UDim2.new(0,0,Section_2Size.Y.Scale,0)
	Section_3.Size = UDim2.new(0,0,Section_3Size.Y.Scale,0)

	Section_1.GroupTransparency = 1
	Section_2.GroupTransparency = 1
	Section_3.GroupTransparency = 1

	local ButtonTypes = {
		["Basic"] = BasicButtonType;
		["Textbox"] = Textbox;
	};

	local SectorTypes = {
		["Sect1"] = Section_1;
		["Sect2"] = Section_2;
		["Sect3"] = Section_3;
	};

	local Tags = {

	};

	local TweenInfos = {
		["Button Tweening"] = TweenInfo.new(0.5,Enum.EasingStyle.Quint,Enum.EasingDirection.InOut);
		["Sector Tweening"] = TweenInfo.new(1,Enum.EasingStyle.Quint,Enum.EasingDirection.InOut);
		["Transparency"] = TweenInfo.new(0.76,Enum.EasingStyle.Quint,Enum.EasingDirection.InOut);
	};

	local Debs = {

	};

	local Funcs = {

	};

	local On = Color3.fromRGB(80, 49, 255)
	local Off = Color3.fromRGB(30,30,30)

	local Play = script:WaitForChild("Sound")

	local M1 = function(Button:TextButton)
		Play:Play()
		if not Button then return end
		local Deb = Debs[Button]
		if Deb == nil then return end

		local F1 = Funcs[Button]["On"]
		local F2 = Funcs[Button]["Off"]
	
		local Parent = Button.Parent
		local Found = Parent:FindFirstChild("TextBox")

		if Found then
			local Char = Client.Character

			local Fenv = getfenv()
			Fenv["__Text"] = Found.Text or "Instance not found"
			Fenv["__Client"] = Client or "Instance not found"
			Fenv["__Character"] = Char or "Instance not found"
			Fenv["__BodyParts"] = Char:GetDescendants() or "Instance not found"
			Fenv["__Root"] = Char:FindFirstChild("HumanoidRootPart") or "Instance not found"
			Fenv["__Humanoid"] = Char:FindFirstChildOfClass("Humanoid") or "Instance not found"
		else
			local Char = Client.Character

			local Fenv = getfenv()
			Fenv["__Client"] = Client or "Instance not found"
			Fenv["__Character"] = Char or "Instance not found"
			Fenv["__BodyParts"] = Char:GetDescendants() or "Instance not found"
			Fenv["__Root"] = Char:FindFirstChild("HumanoidRootPart") or "Instance not found"
			Fenv["__Humanoid"] = Char:FindFirstChildOfClass("Humanoid") or "Instance not found"
		end

		if not Deb then
			if F1 then
				F1()
			
			end

			TweenService:Create(Button,TweenInfos["Button Tweening"],{BackgroundColor3 = On}):Play()
			Debs[Button] = true
		else
			if F2 then
				F2()
			end

			TweenService:Create(Button,TweenInfos["Button Tweening"],{BackgroundColor3 = Off}):Play()
			Debs[Button] = false
		end
	end



	local Inner = _main:WaitForChild("Inner")
	local Topbar = Inner:WaitForChild("Topbar")
	local Placeholder = Topbar:WaitForChild("Scroller"):WaitForChild("Sections"):WaitForChild("Placeholder")
	local Sectors = _main:WaitForChild("Sectors")

	local FindSection = function(String:string)
		if not String then return end

		local AllSectors = Sectors:GetChildren()
		String = String:lower()

		for Index,Value in AllSectors do

			local Name = Value["Name"]:lower()

			if Name == String then
				return Value
			end
		end

	end

	local Current_Sector = _main:WaitForChild("Current Sector")

	local Open = Color3.fromRGB(255,255,255)
	local Closed = Color3.fromRGB(155,155,155)

	local Debounce = false

	Placeholder["TextButton"]["MouseButton1Click"]:Connect(function()
		Play:Play()
		if Debounce then return end
		Debounce = true


		Current_Sector.Value = "Menu"

		for Index,Value in Placeholder["Parent"]:GetChildren() do
			if Value["Name"] == "Menu" then continue end
			if Value["Name"]:find("UI") then continue end

			TweenService:Create(Value["UIStroke"],TweenInfos["Button Tweening"],{Color = Closed}):Play()
		end

		TweenService:Create(Placeholder["UIStroke"],TweenInfos["Button Tweening"],{Color = Open}):Play()

		local Sectors = Sectors:GetChildren()


		for Index,Value in Sectors do
			if Value["Name"] == "Menu" then continue end
			for Index,Value in Value:GetChildren() do
				task.wait(0.15)
				TweenService:Create(Value,TweenInfos["Button Tweening"],{Size = UDim2.new(Value.Size.X.Scale,0,0,0)}):Play()
				TweenService:Create(Value,TweenInfos["Transparency"],{GroupTransparency = 1}):Play()
			end
		end

		task.wait(0.3)

		for Index,Value in FindSection("Menu"):GetChildren() do
			local S = Value:GetAttribute("Size")
			if Value.Size ~= S then
				Value.Size = UDim2.new(0,0,S.X.Scale,0)
			end
			task.wait(0.15)
			TweenService:Create(Value,TweenInfos["Sector Tweening"],{Size = S}):Play()
			TweenService:Create(Value,TweenInfos["Transparency"],{GroupTransparency = 0}):Play()
		end
		Debounce = false
	end)


	local Scrollers = {}

	RunService["RenderStepped"]:Connect(function()
		for Index,Scroller:ScrollingFrame in Scrollers do
			local List:UIListLayout = Scroller:FindFirstChildOfClass("UIListLayout")

			if List then
				Scroller.CanvasSize = UDim2.new(0, 0, 0, Scroller.UIListLayout.AbsoluteContentSize.Y)
			end
		end
	end)

	local Functions = {
		["Create Button"] = function(Array)
			if not Array then return end
			if typeof(Array) ~= "table" then return end

			local SectorName = Array["Sector"]
			local SectionName = Array["Section"]
			local Title = Array["Title"]
			local Type = Array["Type"]

			local Sector = CollectionService:GetTagged(SectorName:lower().."&"..SectionName:lower())[1]
			local Button = ButtonTypes[Type]
			local ButtonExists = CollectionService:GetTagged(SectorName:lower().."&"..SectionName:lower().."&"..Title:lower())[1]

			if ButtonExists then return end

			if not Sector then return end
			if not Button then return end

			local Clone:Frame = Button:Clone()
			Clone:AddTag(SectorName:lower().."&"..SectionName:lower().."&"..Title:lower())
			Clone.Visible = true

			local Title2:TextLabel = Clone:WaitForChild("Title")
			Title2.Text = Title

			local CloneSize = Clone.Size
			Clone.Size = UDim2.new(0,0,0,0)

			Clone.Parent = Sector:WaitForChild("Sect"):WaitForChild("Scroller"):WaitForChild("ScrollingFrame")

			local Button_ = Clone:WaitForChild("Button")
			Button_:AddTag(Title)
			Debs[Button_] = false
			Funcs[Button_] = {}

			Button_.MouseButton1Click:Connect(function()
				M1(Button_)
			end)

			TweenService:Create(Clone,TweenInfos["Button Tweening"],{Size = CloneSize}):Play()
		end;

		["Set Button Function"] = function(Array)
			if not Array then return end
			if typeof(Array) ~= "table" then return end

			local ButtonName = Array["Name"]
			local Start = Array["Run"]
			local End = Array["Stop"]

			local Button = CollectionService:GetTagged(ButtonName)[1]

			if not Button then return end
			if not Start or not End then return end

			local Function = loadstring(Start)
			local Function2 = loadstring(End)

			Funcs[Button]["On"] = Function
			Funcs[Button]["Off"] = Function2
		end;

		["Create Sector"] = function(Array)
			if not Array then return end
			if typeof(Array) ~= "table" then return end

			local SectorType = Array["Type"]
			local Title = Array["Title"]
			local Section = Array["Section"]

			local Sector:CanvasGroup = SectorTypes[SectorType]

			local Found = CollectionService:GetTagged(Title:lower().."&"..Section:lower())[1]

			if Found then warn("Section already exists") return end
			if not Sector then return end

			local Section = FindSection(Section)

			if not Section then return end

			local Clone = Sector:Clone()

			local Size = Clone:GetAttribute("Size")

			Clone.Name = Title
			Clone.Visible = true

			local Holder = Clone:WaitForChild("Sect")
			local __Title = Holder:WaitForChild("Folder"):WaitForChild("TextLabel")
			local Scroller = Holder:WaitForChild("Scroller"):WaitForChild("ScrollingFrame")

			table.insert(Scrollers,Scroller)

			__Title.Text = Title

			Clone.Parent = Section

			Clone:AddTag(Title:lower().."&"..Section.Name:lower())
			if Current_Sector.Value == Section.Name then
				TweenService:Create(Clone,TweenInfos["Sector Tweening"],{GroupTransparency = 0}):Play()
				TweenService:Create(Clone,TweenInfos["Sector Tweening"],{Size = Size}):Play()
			end
		end;

		["Create Section"] = function(Array)
			if not Array then return end
			if typeof(Array) ~= "table" then return end

			local Name = Array["Name"]

			if not Name then return end

			local Clone = Placeholder:Clone()
			Clone["TextLabel"]["Text"] = Name
			Clone.Name = Name

			local NewFolder = Instance.new("Folder")
			NewFolder.Name = Name
			NewFolder.Parent = Sectors

			Clone["TextButton"]["MouseButton1Click"]:Connect(function()
				Play:Play()
				if Debounce then return end
				Debounce = true
				Current_Sector.Value = Name

				for Index,Value in Placeholder["Parent"]:GetChildren() do
					if Value["Name"] == Name then continue end
					if Value["Name"]:find("UI") then continue end
					TweenService:Create(Value["UIStroke"],TweenInfos["Button Tweening"],{Color = Closed}):Play()
				end

				TweenService:Create(Clone["UIStroke"],TweenInfos["Button Tweening"],{Color = Open}):Play()

				local Sectors = Sectors:GetChildren()


				for Index,Value in Sectors do
					if Value["Name"] == Name then continue end

					for Index,Value in Value:GetChildren() do
						task.wait(0.15)
						TweenService:Create(Value,TweenInfos["Button Tweening"],{Size = UDim2.new(Value.Size.X.Scale,0,0,0)}):Play()
						TweenService:Create(Value,TweenInfos["Transparency"],{GroupTransparency = 1}):Play()
					end
				end

				task.wait(0.3)

				for Index,Value in FindSection(Name):GetChildren() do
					local S = Value:GetAttribute("Size")
					if Value.Size ~= S then
						Value.Size = UDim2.new(0,0,S.X.Scale,0)
					end


					task.wait(0.15)
					TweenService:Create(Value,TweenInfos["Sector Tweening"],{Size = S}):Play()
					TweenService:Create(Value,TweenInfos["Transparency"],{GroupTransparency = 0}):Play()
				end
				Debounce = false
			end)

			Clone["Parent"] = Topbar:WaitForChild("Scroller"):WaitForChild("Sections")
		end,
	};

	return Functions
end;

return C_4c()
