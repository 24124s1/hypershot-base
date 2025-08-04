-- anti kick 
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local KickRemote = ReplicatedStorage:WaitForChild("Network"):WaitForChild("Remotes"):WaitForChild("Kick")

local mt = getrawmetatable(game)
local oldNamecall = mt.__namecall
setreadonly(mt, false)

mt.__namecall = newcclosure(function(self, ...)
    local method = getnamecallmethod()
    if self == KickRemote and (method == "FireServer" or method == "InvokeServer") then
        return nil
    end
    return oldNamecall(self, ...)
end)

setreadonly(mt, true)

-- discord changer
local Players = game:GetService("Players")
local StarterGui = game:GetService("StarterGui")
local LocalPlayer = Players.LocalPlayer

local playerDiscordLink = LocalPlayer:WaitForChild("PlayerGui"):WaitForChild("MenuUI")
    :WaitForChild("SecondaryFrames"):WaitForChild("HomeFrame"):WaitForChild("DiscordLink")
playerDiscordLink.Text = "https://discord.gg/s2mFECrAD2"

local starterDiscordLink = StarterGui:WaitForChild("MenuUI")
    :WaitForChild("SecondaryFrames"):WaitForChild("HomeFrame"):WaitForChild("DiscordLink")
starterDiscordLink.Text = "gg/s2mFECrAD2"

-- skin changer
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local skinModuleScript = ReplicatedStorage.Modules.SkinModules.SkinModule

local skinModule = require(skinModuleScript)
local gunSkins = require(skinModuleScript:WaitForChild("GunSkins"))

local selectedSkinName = "Rainbow Camo"

local allSkins  = {
    ["Army Camo"] = {
        ["ID"] = 14126650477,
        ["Rarity"] = 1,
        ["Brightness"] = 0.85,
        ["Scale"] = 1.2
    },
    ["Magic Books"] = {
        ["ID"] = 14126642947,
        ["Rarity"] = 1
    },
    ["Vines Stained Glass"] = {
        ["ID"] = 14126638304,
        ["Rarity"] = 1,
        ["Brightness"] = 0.9
    },
    ["Zebra"] = {
        ["ID"] = 14126637474,
        ["Rarity"] = 1
    },
    ["Arctic Camo"] = {
        ["ID"] = 14126650594,
        ["Rarity"] = 1,
        ["Brightness"] = 0.8,
        ["Scale"] = 1.2
    },
    ["Angelic Wings"] = {
        ["ID"] = 14126650744,
        ["Rarity"] = 1,
        ["Brightness"] = 0.8,
        ["Scale"] = 1.2
    },
    ["Royal Camo"] = {
        ["ID"] = 14126640031,
        ["Rarity"] = 1,
        ["Brightness"] = 0.95
    },
    ["Wheatfield"] = {
        ["ID"] = 14512599646,
        ["Rarity"] = 1,
        ["Brightness"] = 0.9,
        ["Scale"] = 1.2
    },
    ["Compass"] = {
        ["ID"] = 14126647962,
        ["Rarity"] = 1,
        ["Brightness"] = 0.8,
        ["Scale"] = 0.9
    },
    ["Orange Chemical"] = {
        ["ID"] = 14512599075,
        ["Rarity"] = 1,
        ["Brightness"] = 0.8
    },
    ["Sharks"] = {
        ["ID"] = 14126639951,
        ["Rarity"] = 1,
        ["Scale"] = 1.5
    },
    ["CPU"] = {
        ["ID"] = 14126647871,
        ["Rarity"] = 1,
        ["Scale"] = 1.2
    },
    ["Desert Pixel Camo"] = {
        ["ID"] = 14126647141,
        ["Rarity"] = 1,
        ["Brightness"] = 0.9,
        ["Scale"] = 1.3
    },
    ["Watercolor Flowers"] = {
        ["ID"] = 14126638083,
        ["Rarity"] = 1,
        ["Brightness"] = 0.8
    },
    ["Gray Camo"] = {
        ["ID"] = 14126644829,
        ["Rarity"] = 1,
        ["Brightness"] = 0.8,
        ["Scale"] = 1.4
    },
    ["Ice Glitched"] = {
        ["ID"] = 14126643878,
        ["Rarity"] = 1,
        ["Brightness"] = 0.9
    },
    ["Lettuce"] = {
        ["ID"] = 14126643107,
        ["Rarity"] = 1,
        ["Brightness"] = 0.85
    },
    ["Flamingo Camo"] = {
        ["ID"] = 14126646370,
        ["Rarity"] = 1,
        ["Brightness"] = 0.75
    },
    ["Chessboard"] = {
        ["ID"] = 14512597113,
        ["Rarity"] = 1,
        ["Brightness"] = 0.9
    },
    ["Blue Camo"] = {
        ["ID"] = 14126650048,
        ["Rarity"] = 1,
        ["Brightness"] = 0.85,
        ["Scale"] = 1.2
    },
    ["Tree Bark"] = {
        ["ID"] = 14126638644,
        ["Rarity"] = 1,
        ["Brightness"] = 0.9
    },
    ["Spiderwebs"] = {
        ["ID"] = 14512596739,
        ["Rarity"] = 1,
        ["Scale"] = 1.1
    },
    ["Green Skulls"] = {
        ["ID"] = 14512596293,
        ["Rarity"] = 1
    },
    ["QR Code"] = {
        ["ID"] = 14512599405,
        ["Rarity"] = 1,
        ["Scale"] = 1.8
    },
    ["Ghostly Flames"] = {
        ["ID"] = 14126645508,
        ["Rarity"] = 1,
        ["Brightness"] = 0.8
    },
    ["Rain"] = {
        ["ID"] = 14126640495,
        ["Rarity"] = 1,
        ["Brightness"] = 0.95,
        ["Scale"] = 1.3
    },
    ["Purple Camo"] = {
        ["ID"] = 14126640980,
        ["Rarity"] = 1,
        ["Brightness"] = 0.9
    },
    ["Map"] = {
        ["ID"] = 14126642619,
        ["Rarity"] = 1,
        ["Brightness"] = 0.9,
        ["Scale"] = 1.3
    },
    ["Rainbow Camo"] = {
        ["ID"] = 14126640422,
        ["Rarity"] = 1,
        ["Brightness"] = 0.85
    },
    ["Moon Surface"] = {
        ["ID"] = 14126642371,
        ["Rarity"] = 1,
        ["Brightness"] = 0.95
    },
    ["Green Pixelated"] = {
        ["ID"] = 14126644250,
        ["Rarity"] = 1,
        ["Brightness"] = 0.8
    },
    ["Doves"] = {
        ["ID"] = 14126646758,
        ["Rarity"] = 1,
        ["Brightness"] = 0.85
    },
    ["Kawaii Cute Animals"] = {
        ["ID"] = 14126643421,
        ["Rarity"] = 1,
        ["Brightness"] = 0.9,
        ["Scale"] = 1.2
    },
    ["Army Pixel Camo"] = {
        ["ID"] = 14126650387,
        ["Rarity"] = 1,
        ["Brightness"] = 0.9
    },
    ["Dirt"] = {
        ["ID"] = 14126647044,
        ["Rarity"] = 1,
        ["Brightness"] = 0.9
    },
    ["Pretty Meadow"] = {
        ["ID"] = 14126641059,
        ["Rarity"] = 1,
        ["Brightness"] = 0.8
    },
    ["Blue Grid"] = {
        ["ID"] = 14126649734,
        ["Rarity"] = 1,
        ["Brightness"] = 0.85
    },
    ["Gray Yellow Camo"] = {
        ["ID"] = 14126644661,
        ["Rarity"] = 1,
        ["Brightness"] = 0.85,
        ["Scale"] = 1.5
    },
    ["Blue Glitter"] = {
        ["ID"] = 14512595899,
        ["Rarity"] = 2
    },
    ["Dark Gray Camo"] = {
        ["ID"] = 14126647752,
        ["Rarity"] = 2,
        ["Brightness"] = 0.9,
        ["Scale"] = 1.5
    },
    ["Fruits Stained Glass"] = {
        ["ID"] = 14126645970,
        ["Rarity"] = 2,
        ["Brightness"] = 0.95,
        ["Scale"] = 1.4
    },
    ["Icy"] = {
        ["ID"] = 14126643788,
        ["Rarity"] = 2,
        ["Brightness"] = 0.8,
        ["Scale"] = 1.3
    },
    ["Snowflakes Stained Glass"] = {
        ["ID"] = 14511704387,
        ["Rarity"] = 2,
        ["Brightness"] = 0.9
    },
    ["Furry Monster"] = {
        ["ID"] = 14126645842,
        ["Rarity"] = 2
    },
    ["Colorful Pixelated"] = {
        ["ID"] = 14126648043,
        ["Rarity"] = 2,
        ["Brightness"] = 0.85,
        ["Scale"] = 0.5
    },
    ["Forest Stained Glass"] = {
        ["ID"] = 14126646272,
        ["Rarity"] = 2,
        ["Brightness"] = 0.95
    },
    ["Starfish"] = {
        ["ID"] = 14126639326,
        ["Rarity"] = 2,
        ["Brightness"] = 0.7
    },
    ["Blue Pixelated"] = {
        ["ID"] = 14126649461,
        ["Rarity"] = 2,
        ["Brightness"] = 0.85
    },
    ["Orange Blue Camo"] = {
        ["ID"] = 14126641821,
        ["Rarity"] = 2,
        ["Brightness"] = 0.9,
        ["Scale"] = 2
    },
    ["Denim"] = {
        ["ID"] = 14126647264,
        ["Rarity"] = 2,
        ["Scale"] = 1.2
    },
    ["Beautiful Clouds"] = {
        ["ID"] = 14126650299,
        ["Rarity"] = 2,
        ["Brightness"] = 0.85,
        ["Scale"] = 1.4
    },
    ["Gemstones"] = {
        ["ID"] = 14183335080,
        ["Rarity"] = 2,
        ["Brightness"] = 0.9
    },
    ["Vaporwave Camo"] = {
        ["ID"] = 14126638523,
        ["Rarity"] = 2,
        ["Brightness"] = 0.8,
        ["Scale"] = 1.4
    },
    ["Watermelon Camo"] = {
        ["ID"] = 14126637994,
        ["Rarity"] = 2,
        ["Brightness"] = 0.9
    },
    ["Tiedye"] = {
        ["ID"] = 14126638764,
        ["Rarity"] = 2,
        ["Brightness"] = 0.85
    },
    ["Beige Camo"] = {
        ["ID"] = 14126650145,
        ["Rarity"] = 2,
        ["Brightness"] = 0.75
    },
    ["Jellyfish"] = {
        ["ID"] = 14126643566,
        ["Rarity"] = 2,
        ["Brightness"] = 0.9
    },
    ["Blue Feathers"] = {
        ["ID"] = 14126649958,
        ["Rarity"] = 2,
        ["Brightness"] = 0.9
    },
    ["Blue Teal Camo"] = {
        ["ID"] = 14126649111,
        ["Rarity"] = 2,
        ["Brightness"] = 0.95,
        ["Scale"] = 1.2
    },
    ["Dark Gray Red Camo"] = {
        ["ID"] = 14126647634,
        ["Rarity"] = 2,
        ["Brightness"] = 0.85,
        ["Scale"] = 1.1
    },
    ["Fireworks"] = {
        ["ID"] = 14126646530,
        ["Rarity"] = 2,
        ["Brightness"] = 0.9,
        ["Scale"] = 1.2
    },
    ["Embossed Leaves"] = {
        ["ID"] = 14512598144,
        ["Rarity"] = 2
    },
    ["Plaid"] = {
        ["ID"] = 14126641226,
        ["Rarity"] = 2,
        ["Brightness"] = 0.9
    },
    ["Blue Watercolor"] = {
        ["ID"] = 14126648916,
        ["Rarity"] = 2,
        ["Brightness"] = 0.8
    },
    ["Ocean Water"] = {
        ["ID"] = 14126641988,
        ["Rarity"] = 2,
        ["Brightness"] = 0.85,
        ["Scale"] = 1.2
    },
    ["Yellow Purple Camo"] = {
        ["ID"] = 14126637723,
        ["Rarity"] = 2,
        ["Brightness"] = 0.9
    },
    ["Yellow Camo"] = {
        ["ID"] = 14126637811,
        ["Rarity"] = 2,
        ["Brightness"] = 0.85,
        ["Scale"] = 2
    },
    ["Pink Pixelated"] = {
        ["ID"] = 14126641324,
        ["Rarity"] = 2,
        ["Brightness"] = 0.85
    },
    ["Dirty Pink Camo"] = {
        ["ID"] = 14126646917,
        ["Rarity"] = 2,
        ["Brightness"] = 0.95
    },
    ["Rainbow Wavy"] = {
        ["ID"] = 15085309141,
        ["Rarity"] = 2,
        ["Brightness"] = 0.8
    },
    ["Pink Marble"] = {
        ["ID"] = 14126641479,
        ["Rarity"] = 2,
        ["Brightness"] = 0.75
    },
    ["Wolf Fur"] = {
        ["ID"] = 14126637909,
        ["Rarity"] = 3,
        ["Brightness"] = 0.9
    },
    ["Neon Animals"] = {
        ["ID"] = 14126642264,
        ["Rarity"] = 3
    },
    ["Lava Pixelated"] = {
        ["ID"] = 14126643250,
        ["Rarity"] = 3
    },
    ["Inkblot Splatters"] = {
        ["ID"] = 15085308872,
        ["Rarity"] = 3,
        ["Brightness"] = 0.9
    },
    ["Glitch"] = {
        ["ID"] = 14126645326,
        ["Rarity"] = 3,
        ["Brightness"] = 0.9
    },
    ["Green Glitched Camo"] = {
        ["ID"] = 14126644548,
        ["Rarity"] = 3,
        ["Brightness"] = 0.9,
        ["Scale"] = 1.2
    },
    ["Glitched Camo"] = {
        ["ID"] = 14126645188,
        ["Rarity"] = 3,
        ["Scale"] = 1.2
    },
    ["Snowflakes"] = {
        ["ID"] = 14126639587,
        ["Rarity"] = 3
    },
    ["Pets Stained Glass"] = {
        ["ID"] = 14126641654,
        ["Rarity"] = 3,
        ["Brightness"] = 0.9,
        ["Scale"] = 1.2
    },
    ["Yellow Purple Fire"] = {
        ["ID"] = 14126637639,
        ["Rarity"] = 3
    },
    ["Aliens"] = {
        ["ID"] = 14126651027,
        ["Rarity"] = 3
    },
    ["Infared Pixel"] = {
        ["ID"] = 14126643665,
        ["Rarity"] = 3,
        ["Brightness"] = 0.9
    },
    ["Abstract Wavy"] = {
        ["ID"] = 14126651275,
        ["Rarity"] = 3
    },
    ["Purple Glitter"] = {
        ["ID"] = 14512596486,
        ["Rarity"] = 3
    },
    ["Mixed Camo"] = {
        ["ID"] = 14126642492,
        ["Rarity"] = 3,
        ["Brightness"] = 0.85,
        ["Scale"] = 1.3
    },
    ["Vibrant Feathers"] = {
        ["ID"] = 14126638404,
        ["Rarity"] = 3,
        ["Brightness"] = 0.9
    },
    ["Pink Leopard"] = {
        ["ID"] = 14126641569,
        ["Rarity"] = 3,
        ["Brightness"] = 0.9,
        ["Scale"] = 1.4
    },
    ["Cherry Blossom"] = {
        ["ID"] = 14126648246,
        ["Rarity"] = 3,
        ["Brightness"] = 0.8
    },
    ["Cartoon Lava"] = {
        ["ID"] = 14126648530,
        ["Rarity"] = 3,
        ["Brightness"] = 0.75
    },
    ["Space Invaders"] = {
        ["ID"] = 14126639461,
        ["Rarity"] = 3
    },
    ["Orange Leopard"] = {
        ["ID"] = 14126641724,
        ["Rarity"] = 3,
        ["Brightness"] = 0.9,
        ["Scale"] = 1.1
    },
    ["Grunge Flowers"] = {
        ["ID"] = 15085308750,
        ["Rarity"] = 3
    },
    ["Cosmic Pulsars"] = {
        ["ID"] = 14512597572,
        ["Rarity"] = 3
    },
    ["Neon Symbols"] = {
        ["ID"] = 15085308971,
        ["Rarity"] = 3
    },
    ["Ocean Waves"] = {
        ["ID"] = 14126641895,
        ["Rarity"] = 3,
        ["Brightness"] = 0.9
    },
    ["Blue Leopard"] = {
        ["ID"] = 14126649639,
        ["Rarity"] = 3,
        ["Brightness"] = 0.9
    },
    ["Magic Symbols"] = {
        ["ID"] = 14126642704,
        ["Rarity"] = 3
    },
    ["Beautiful Swirls"] = {
        ["ID"] = 14512596935,
        ["Rarity"] = 3
    },
    ["Glitch 2"] = {
        ["ID"] = 14183334869,
        ["Rarity"] = 3,
        ["Brightness"] = 0.95,
        ["Scale"] = 1.1
    },
    ["Magic Symbols 2"] = {
        ["ID"] = 14148364266,
        ["Rarity"] = 3
    },
    ["Forest"] = {
        ["ID"] = 14126646196,
        ["Rarity"] = 3,
        ["Brightness"] = 0.85
    },
    ["Embossed Flowers"] = {
        ["ID"] = 14512597830,
        ["Rarity"] = 3
    },
    ["Alien Flowers"] = {
        ["ID"] = 14126651164,
        ["Rarity"] = 3
    },
    ["Chaotic Brushstrokes"] = {
        ["ID"] = 14126648408,
        ["Rarity"] = 4,
        ["Brightness"] = 0.9
    },
    ["Red Blue Fire"] = {
        ["ID"] = 14126640328,
        ["Rarity"] = 4,
        ["Direction"] = "Up",
        ["Move"] = true
    },
    ["Carbon Fiber"] = {
        ["ID"] = 14126648643,
        ["Rarity"] = 4,
        ["Scale"] = 1.8
    },
    ["Amber Crystal"] = {
        ["ID"] = 14126650824,
        ["Rarity"] = 4,
        ["Brightness"] = 0.85
    },
    ["Dark Matter"] = {
        ["ID"] = 14126647466,
        ["Rarity"] = 4,
        ["Scale"] = 1.3,
        ["Move"] = true
    },
    ["Cosmic Night"] = {
        ["ID"] = 14512597307,
        ["Rarity"] = 4,
        ["Move"] = true
    },
    ["DNA"] = {
        ["ID"] = 14126646843,
        ["Rarity"] = 4,
        ["Brightness"] = 0.9,
        ["Direction"] = "Up",
        ["Move"] = true
    },
    ["Dragon Scales"] = {
        ["ID"] = 14126646664,
        ["Rarity"] = 4,
        ["Brightness"] = 0.75,
        ["Scale"] = 1.2
    },
    ["Brown Teal Fire"] = {
        ["ID"] = 14126648825,
        ["Rarity"] = 4,
        ["Brightness"] = 0.95,
        ["Direction"] = "Up",
        ["Move"] = true
    },
    ["Cloudy Night"] = {
        ["ID"] = 14126648128,
        ["Rarity"] = 4,
        ["Brightness"] = 0.85,
        ["Move"] = true
    },
    ["Honeycombs"] = {
        ["ID"] = 14126643986,
        ["Rarity"] = 4,
        ["Brightness"] = 0.8
    },
    ["Frozen In Ice"] = {
        ["ID"] = 14126646071,
        ["Rarity"] = 4,
        ["Brightness"] = 0.9,
        ["Direction"] = "Up",
        ["Move"] = true
    },
    ["Dark Purple Prism"] = {
        ["ID"] = 14126647366,
        ["Rarity"] = 4,
        ["Brightness"] = 0.9
    },
    ["Purple Prism"] = {
        ["ID"] = 14126640624,
        ["Rarity"] = 4,
        ["Brightness"] = 0.75
    },
    ["Northern Lights"] = {
        ["ID"] = 14126642115,
        ["Rarity"] = 4,
        ["Scale"] = 1.5,
        ["Move"] = true
    },
    ["Night Sky"] = {
        ["ID"] = 14512598816,
        ["Rarity"] = 4,
        ["Move"] = true
    },
    ["Surging Green"] = {
        ["ID"] = 14126638951,
        ["Rarity"] = 4,
        ["Brightness"] = 0.9,
        ["Move"] = true
    },
    ["Blue Red Feathers"] = {
        ["ID"] = 14126649217,
        ["Rarity"] = 4,
        ["Brightness"] = 0.9
    },
    ["Explosion"] = {
        ["ID"] = 14512598366,
        ["Rarity"] = 4,
        ["Brightness"] = 0.9,
        ["Scale"] = 1.1
    },
    ["Purple Fire"] = {
        ["ID"] = 14126640774,
        ["Rarity"] = 4,
        ["Brightness"] = 0.8,
        ["Direction"] = "Up",
        ["Move"] = true
    },
    ["Blue Fire"] = {
        ["ID"] = 14126649837,
        ["Rarity"] = 4,
        ["Brightness"] = 0.9,
        ["Direction"] = "Up",
        ["Move"] = true
    },
    ["Poison Gas"] = {
        ["ID"] = 14126641144,
        ["Rarity"] = 4,
        ["Scale"] = 1.4
    },
    ["Green Nebulas"] = {
        ["ID"] = 14126644394,
        ["Rarity"] = 4,
        ["Brightness"] = 0.95
    },
    ["Volcano"] = {
        ["ID"] = 14126638191,
        ["Rarity"] = 5,
        ["Direction"] = "Up",
        ["Move"] = true
    },
    ["Blue Purple Fire"] = {
        ["ID"] = 14126649355,
        ["Rarity"] = 5,
        ["Brightness"] = 0.9,
        ["Direction"] = "Up",
        ["Move"] = true
    },
    ["Toxic Acid"] = {
        ["ID"] = 139024514137134,
        ["Rarity"] = 5,
        ["Scale"] = 3,
        ["Speed"] = 1,
        ["Direction"] = "Normal",
        ["Move"] = true,
        ["PartColor"] = Color3.fromRGB(174, 255, 98)
    },
    ["The Art of War"] = {
        ["ID"] = 14126638860,
        ["Rarity"] = 5,
        ["Brightness"] = 0.9,
        ["Scale"] = 1.3,
        ["Speed"] = 0.5,
        ["Direction"] = "Up",
        ["Move"] = true,
        ["PartColor"] = Color3.fromRGB(255, 103, 103)
    },
    ["Tentacles"] = {
        ["ID"] = 110513782713883,
        ["Rarity"] = 5,
        ["Speed"] = 0.5,
        ["Direction"] = "Up",
        ["Move"] = true,
        ["PartColor"] = Color3.fromRGB(139, 253, 255)
    },
    ["Radiant Tiger"] = {
        ["ID"] = 103380947058022,
        ["Rarity"] = 5,
        ["Speed"] = 0.2,
        ["Direction"] = "Up",
        ["Move"] = true,
        ["PartColor"] = Color3.fromRGB(255, 150, 89)
    },
    ["Fracture in Time"] = {
        ["ID"] = 138907703810465,
        ["Rarity"] = 5,
        ["Speed"] = 0.5,
        ["Direction"] = "Normal",
        ["Move"] = true,
        ["PartColor"] = Color3.fromRGB(220, 165, 248)
    },
    ["Holy Water"] = {
        ["ID"] = 79229984450836,
        ["Rarity"] = 5,
        ["Speed"] = 2,
        ["Direction"] = "Normal",
        ["Move"] = true,
        ["PartColor"] = Color3.fromRGB(116, 213, 255)
    },
    ["Hacker"] = {
        ["ID"] = 137076076340477,
        ["Rarity"] = 5,
        ["Brightness"] = 0.9,
        ["Scale"] = 4,
        ["Speed"] = 0.7,
        ["Direction"] = "Down",
        ["Move"] = true,
        ["PartColor"] = Color3.fromRGB(129, 255, 133)
    },
    ["Shooting Stars"] = {
        ["ID"] = 14126639825,
        ["Rarity"] = 5,
        ["Direction"] = "DownLeft",
        ["Move"] = true,
        ["Speed"] = 2
    },
    ["Surging Blue"] = {
        ["ID"] = 14126639064,
        ["Rarity"] = 5,
        ["Brightness"] = 0.8,
        ["Move"] = true
    },
    ["Hacked"] = {
        ["ID"] = 102125831766244,
        ["Rarity"] = 5,
        ["Scale"] = 3,
        ["Speed"] = 1,
        ["Direction"] = "Up",
        ["Move"] = true,
        ["PartColor"] = Color3.fromRGB(55, 255, 0)
    },
    ["Rainy Day"] = {
        ["ID"] = 113787872755848,
        ["Rarity"] = 5,
        ["Scale"] = 2,
        ["Speed"] = 1,
        ["Direction"] = "Down",
        ["Move"] = true,
        ["PartColor"] = Color3.fromRGB(107, 255, 255)
    },
    ["Green Purple Fire"] = {
        ["ID"] = 14126644096,
        ["Rarity"] = 5,
        ["Brightness"] = 0.9,
        ["Direction"] = "Up",
        ["Move"] = true
    },
    ["Purple Lava"] = {
        ["ID"] = 98711734225145,
        ["Rarity"] = 5,
        ["Scale"] = 2,
        ["PartColor2"] = Color3.fromRGB(179, 93, 255),
        ["PartColor"] = Color3.fromRGB(128, 0, 255)
    },
    ["Dark Magic"] = {
        ["ID"] = 14126647568,
        ["Rarity"] = 5,
        ["Direction"] = "Up",
        ["Move"] = true
    },
    ["Inferno Fire"] = {
        ["ID"] = 86167617570089,
        ["Rarity"] = 5,
        ["Speed"] = 1,
        ["Direction"] = "Up",
        ["Move"] = true,
        ["PartColor"] = Color3.fromRGB(255, 135, 80)
    },
    ["Galaxy"] = {
        ["ID"] = 14126645690,
        ["Rarity"] = 5,
        ["Brightness"] = 0.95,
        ["Move"] = true,
        ["Speed"] = 0.5
    },
    ["Circuits"] = {
        ["ID"] = 133410756983661,
        ["Rarity"] = 5,
        ["Brightness"] = 0.75,
        ["Scale"] = 3,
        ["PartColor2"] = Color3.fromRGB(255, 97, 97),
        ["PartColor"] = Color3.fromRGB(101, 196, 255)
    },
    ["Purple Crystal"] = {
        ["ID"] = 14126640910,
        ["Rarity"] = 5,
        ["Brightness"] = 0.95
    },
    ["Starry Night"] = {
        ["ID"] = 14126639208,
        ["Rarity"] = 5,
        ["Scale"] = 1.3,
        ["Move"] = true
    },
    ["Pyrocore Marble"] = {
        ["ID"] = 115675953086497,
        ["Rarity"] = 5,
        ["Scale"] = 1,
        ["PartColor2"] = Color3.fromRGB(255, 99, 38),
        ["PartColor"] = Color3.fromRGB(255, 141, 47),
        ["Move"] = true,
        ["Speed"] = 0.5
    }
}

local selectedSkin = allSkins[selectedSkinName]

if selectedSkin then
    for skinName, skinData in pairs(gunSkins) do
        if type(skinData) == "table" then
            for key, value in pairs(selectedSkin) do
                skinData[key] = value
            end
        end
    end
else
    warn("Skin not found: " .. selectedSkinName)
end

-- weapon mods
getgenv().ToggleNoSpread = true
getgenv().ToggleInfiniteAmmo = true
getgenv().ToggleNoRecoil = true
getgenv().ToggleInstantReload = true

getgenv().BaseSpread = 0
getgenv().Spread = 0
getgenv().Ammo = 9e9
getgenv().FillAmmo = 9e9
getgenv().Debounce = 0
getgenv().ReloadTime = -1
getgenv().Auto = true

getgenv().MinCamRecoil = Vector3.new(0,0,0)
getgenv().MaxCamRecoil = Vector3.new(0,0,0)
getgenv().CamRecoilConstant = 0

getgenv().MinRotRecoil = Vector3.new(0,0,0)
getgenv().MaxRotRecoil = Vector3.new(0,0,0)
getgenv().RotRecoilConstant = 0

getgenv().MinTransRecoil = Vector3.new(0,0,0)
getgenv().MaxTransRecoil = Vector3.new(0,0,0)
getgenv().TransRecoilConstant = 0

local function deepCopy(tbl)
    if type(tbl) ~= "table" then return tbl end
    local copy = {}
    for k, v in pairs(tbl) do
        copy[k] = type(v) == "table" and deepCopy(v) or v
    end
    return copy
end

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local ModulesFolder = ReplicatedStorage:WaitForChild("Weapons"):WaitForChild("Modules")

getgenv()._OriginalWeaponData = getgenv()._OriginalWeaponData or {}

local function getGlobalOrDefault(name, default)
    local val = getgenv()[name]
    if val == nil then
        return default
    end
    return val
end

for _, module in pairs(ModulesFolder:GetChildren()) do
    if module:IsA("ModuleScript") then
        local success, weaponData = pcall(require, module)
        if success and type(weaponData) == "table" then
            local name = module.Name
            if not getgenv()._OriginalWeaponData[name] then
                getgenv()._OriginalWeaponData[name] = deepCopy(weaponData)
            end

            local original = getgenv()._OriginalWeaponData[name]

            if getgenv().ToggleNoSpread then
                weaponData.BaseSpread = getGlobalOrDefault("BaseSpread", weaponData.BaseSpread)
                weaponData.Spread = getGlobalOrDefault("Spread", weaponData.Spread)
            else
                weaponData.BaseSpread = original.BaseSpread
                weaponData.Spread = original.Spread
            end

            if getgenv().ToggleInfiniteAmmo then
                weaponData.Ammo = getGlobalOrDefault("Ammo", weaponData.Ammo)
                weaponData.FillAmmo = getGlobalOrDefault("FillAmmo", weaponData.FillAmmo)
            else
                weaponData.Ammo = original.Ammo
                weaponData.FillAmmo = original.FillAmmo
            end

            if getgenv().ToggleInstantReload then
                weaponData.ReloadTime = getGlobalOrDefault("ReloadTime", weaponData.ReloadTime)
                weaponData.Debounce = getGlobalOrDefault("Debounce", weaponData.Debounce)
            else
                weaponData.ReloadTime = original.ReloadTime
                weaponData.Debounce = original.Debounce
            end

            if getgenv().ToggleNoRecoil then
                weaponData.MinCamRecoil = getGlobalOrDefault("MinCamRecoil", weaponData.MinCamRecoil)
                weaponData.MaxCamRecoil = getGlobalOrDefault("MaxCamRecoil", weaponData.MaxCamRecoil)
                weaponData.CamRecoilConstant = getGlobalOrDefault("CamRecoilConstant", weaponData.CamRecoilConstant)

                weaponData.MinRotRecoil = getGlobalOrDefault("MinRotRecoil", weaponData.MinRotRecoil)
                weaponData.MaxRotRecoil = getGlobalOrDefault("MaxRotRecoil", weaponData.MaxRotRecoil)
                weaponData.RotRecoilConstant = getGlobalOrDefault("RotRecoilConstant", weaponData.RotRecoilConstant)

                weaponData.MinTransRecoil = getGlobalOrDefault("MinTransRecoil", weaponData.MinTransRecoil)
                weaponData.MaxTransRecoil = getGlobalOrDefault("MaxTransRecoil", weaponData.MaxTransRecoil)
                weaponData.TransRecoilConstant = getGlobalOrDefault("TransRecoilConstant", weaponData.TransRecoilConstant)
            else
                weaponData.MinCamRecoil = original.MinCamRecoil
                weaponData.MaxCamRecoil = original.MaxCamRecoil
                weaponData.CamRecoilConstant = original.CamRecoilConstant

                weaponData.MinRotRecoil = original.MinRotRecoil
                weaponData.MaxRotRecoil = original.MaxRotRecoil
                weaponData.RotRecoilConstant = original.RotRecoilConstant

                weaponData.MinTransRecoil = original.MinTransRecoil
                weaponData.MaxTransRecoil = original.MaxTransRecoil
                weaponData.TransRecoilConstant = original.TransRecoilConstant
            end

            weaponData.Auto = true
        end
    end
end
-- silent aim 
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local Camera = workspace.CurrentCamera
local Mouse = LocalPlayer:GetMouse()
local WorldToScreenPoint = Camera.WorldToScreenPoint
local GetPlayers = Players.GetPlayers
local FindFirstChild = game.FindFirstChild
local RunService = game:GetService("RunService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

getgenv().ShowFOV = getgenv().ShowFOV or true
getgenv().SilentAim = getgenv().SilentAim or true

local FOV_RADIUS = 1000
local FOV_CIRCLE = Drawing.new("Circle")
FOV_CIRCLE.Thickness = 1
FOV_CIRCLE.Radius = FOV_RADIUS
FOV_CIRCLE.Filled = false
FOV_CIRCLE.Color = Color3.new(1, 1, 1)
FOV_CIRCLE.Transparency = 0.5
FOV_CIRCLE.Visible = false

local function GetOnScreenPosition(V3)
    local Position, IsVisible = WorldToScreenPoint(Camera, V3)
    return Vector2.new(Position.X, Position.Y), IsVisible
end

local function GetDirection(Origin, Position)
    return (Position - Origin).Unit * (Origin - Position).Magnitude
end

local function GetMousePosition()
    return Vector2.new(Mouse.X, Mouse.Y)
end

local function GetClosestPlayer()
    local Closest, Distance = nil, FOV_RADIUS
    for _, Player in next, GetPlayers(Players) do
        if Player ~= LocalPlayer then
            local Character = Player.Character
            local Head = Character and FindFirstChild(Character, "Head")
            local Humanoid = Character and FindFirstChild(Character, "Humanoid")
            if Head and (Humanoid and Humanoid.Health > 0) then
                local ScreenPos, IsVisible = GetOnScreenPosition(Head.Position)
                if IsVisible then
                    local _Distance = (GetMousePosition() - ScreenPos).Magnitude
                    if _Distance <= Distance then
                        Closest = Head
                        Distance = _Distance
                    end
                end
            end
        end
    end
    return Closest, Distance
end

RunService.RenderStepped:Connect(function()
    FOV_CIRCLE.Position = GetMousePosition()
    FOV_CIRCLE.Visible = getgenv().ShowFOV
end)

local oldNamecall
oldNamecall = hookmetamethod(game, "__namecall", function(...)
    local Method = getnamecallmethod()
    local Arguments = {...}
    if Arguments[1] == workspace and Method == "Raycast" then
        if typeof(Arguments[#Arguments]) ~= "RaycastParams" then
            return oldNamecall(...)
        end
        if getgenv().SilentAim then
            local HitPart = GetClosestPlayer()
            if HitPart then
                Arguments[3] = GetDirection(Arguments[2], HitPart.Position)
                local result = oldNamecall(unpack(Arguments))
                return result
            end
        end
    end
    return oldNamecall(...)
end)
-- kill icon changer 
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local KillIconsFolder = ReplicatedStorage:WaitForChild("KillIcons"):WaitForChild("Modules")

local iconSets = {
    ["Basilisk"] = {
        Edge = 95596435606874,
        Head = 78391378699739,
        Circle = 74117494279747,
        SmokeColor = Color3.fromRGB(150, 255, 84),
        Gems = 2000,
    },
    ["Bull"] = {
        Edge = 139343761638035,
        Head = 85458811410492,
        Circle = 96154277516672,
        SmokeColor = Color3.fromRGB(255, 231, 49),
        Gems = 4000,
    },
    ["Deer"] = {
        Edge = 133452810419090,
        Head = 111098630566320,
        Circle = 73418711850255,
        SmokeColor = Color3.fromRGB(238, 0, 255),
        HeadshotOffset = 0.6,
        Gems = 8000,
    },
    ["Default"] = {
        Edge = 80371118911739,
        Head = 89253445236211,
        Circle = 76189588345097,
        SmokeColor = Color3.fromRGB(0, 221, 255),
        HeadshotOffset = 0.4,
        Coins = 0,
        Gems = 0,
    },
    ["Dominus"] = {
        Edge = 123904651838410,
        Head = 86763718979930,
        Circle = 81560341190063,
        SmokeColor = Color3.fromRGB(255, 47, 47),
        HeadshotOffset = 0.46,
        Gems = 20000,
    },
    ["Horned Beast"] = {
        Edge = 99905090046924,
        Head = 101368969788073,
        Circle = 133968902399414,
        SmokeColor = Color3.fromRGB(247, 0, 255),
        HeadshotOffset = 0.65,
        Gems = 6000,
    },
    ["Masked Soldier"] = {
        Edge = 107630919937306,
        Head = 109261276541321,
        Circle = 131284716843244,
        SmokeColor = Color3.fromRGB(255, 26, 26),
        HeadshotOffset = 0.4,
        Gems = 8000,
    },
    ["Pizza"] = {
        Edge = 78433110189398,
        Head = 82707690794973,
        Circle = 129337466997347,
        SmokeColor = Color3.fromRGB(255, 102, 0),
    },
    ["Robot"] = {
        Edge = 82511112604024,
        Head = 85071742759547,
        Circle = 76214251511326,
        SmokeColor = Color3.fromRGB(255, 161, 46),
        HeadshotOffset = 0.4,
        Gems = 4000,
    },
    ["Trooper"] = {
        Edge = 98123049158952,
        Head = 139195221685164,
        Circle = 97079137113461,
        SmokeColor = Color3.fromRGB(0, 221, 255),
        HeadshotOffset = 0.4,
        Coins = 10000,
        Gems = 2000,
    },
    ["Unicorn"] = {
        Edge = 97002180641179,
        Head = 88341829372753,
        Circle = 137728600081831,
        SmokeColor = Color3.fromRGB(238, 185, 255),
        Gems = 10000,
    },
    ["Wolf"] = {
        Edge = 111544617466415,
        Head = 134868469080740,
        Circle = 121579925866900,
        SmokeColor = Color3.fromRGB(255, 230, 42),
        HeadshotOffset = 0.45,
        Gems = 5500,
    },
}

local chosenSetName = "Dominus"
local chosenData = iconSets[chosenSetName]

for _, moduleScript in pairs(KillIconsFolder:GetChildren()) do
    local iconTable = require(moduleScript)
    for k, v in pairs(chosenData) do
        iconTable[k] = v
    end
end
-- vfx changer
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local KillVFXFolder = ReplicatedStorage:WaitForChild("KillVFX"):WaitForChild("Modules")

local vfxSets = {
    ["Party"] = {
        ImageID = 106728550809077,
        Gems = 3000,
    },
    ["Bubble"] = {
        ImageID = 90201872892348,
        Gems = 4000,
    },
    ["Ghost"] = {
        ImageID = 109971727101317,
        Gems = 4000,
    },
    ["Lightning"] = {
        ImageID = 101427730350807,
        Gems = 2000,
    },
    ["Rainbow Splatter"] = {
        ImageID = 109565078739009,
        Gems = 4000,
    },
    ["Clown"] = {
        ImageID = 72947353158041,
        Gems = 6000,
    },
    ["Toxic"] = {
        ImageID = 136263205000299,
        Gems = 3000,
    },
    ["Earth"] = {
        ImageID = 132113864170654,
        Gems = 2000,
    },
    ["Love"] = {
        ImageID = 91609675676195,
        Gems = 3000,
    },
    ["Inferno"] = {
        ImageID = 137165514100172,
        Gems = 5000,
    },
    ["Black Hole"] = {
        ImageID = 140290713471437,
        Gems = 10000,
    },
    ["Dark Coffin"] = {
        ImageID = 103077360729458,
        Gems = 10000,
    },
    ["Sword of Power"] = {
        ImageID = 81264172558007,
        Gems = 8000,
    },
    ["None"] = {
        ImageID = 76951088469946,
        Gems = 0,
    },
    ["Robux Explosion"] = {
        ImageID = 119288669114706,
        Gems = 5000,
    },
    ["Music Blast"] = {
        ImageID = 96721023834466,
        Gems = 4000,
    },
    ["Lucky"] = {
        ImageID = 95663207861603,
    },
    ["Pizza Party"] = {
        ImageID = 95663207861603,
    },
    ["Explosion"] = {
        ImageID = 127916170399528,
    },
}

local chosenSetName = "Inferno"
local chosenData = vfxSets[chosenSetName]

for _, moduleScript in pairs(KillVFXFolder:GetChildren()) do
    if moduleScript:IsA("ModuleScript") then
        local vfxTable = require(moduleScript)
        for k, v in pairs(chosenData) do
            vfxTable[k] = v
        end
    end
end
