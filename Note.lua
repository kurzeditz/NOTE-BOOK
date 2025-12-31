-- ADVANCED READ ONLY NOTE (SCROLL + RESIZE + MINIMIZE)
-- DELTA EXECUTOR ANDROID READY

local UIS = game:GetService("UserInputService")

local ScreenGui = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
local Title = Instance.new("TextLabel")
local Close = Instance.new("TextButton")
local Min = Instance.new("TextButton")
local Resize = Instance.new("Frame")

local ScrollingFrame = Instance.new("ScrollingFrame")
local Note = Instance.new("TextLabel")

ScreenGui.Parent = game:GetService("CoreGui")
ScreenGui.ResetOnSpawn = false
ScreenGui.Name = "FishItNote"

-- FRAME
Frame.Parent = ScreenGui
Frame.Size = UDim2.new(0,300,0,220)
Frame.Position = UDim2.new(0.1,0,0.2,0)
Frame.BackgroundColor3 = Color3.fromRGB(30,30,30)
Frame.BorderSizePixel = 0
Frame.Active = true
Frame.Draggable = true

-- TITLE BAR
Title.Parent = Frame
Title.Size = UDim2.new(1,0,0,30)
Title.BackgroundColor3 = Color3.fromRGB(45,45,45)
Title.Text = "📌 CATATAN RNG FISH IT"
Title.TextColor3 = Color3.fromRGB(255,255,255)
Title.Font = Enum.Font.SourceSansBold
Title.TextSize = 15

-- CLOSE BUTTON
Close.Parent = Title
Close.Size = UDim2.new(0,30,0,30)
Close.Position = UDim2.new(1,-30,0,0)
Close.Text = "X"
Close.BackgroundColor3 = Color3.fromRGB(180,50,50)
Close.TextColor3 = Color3.fromRGB(255,255,255)
Close.Font = Enum.Font.SourceSansBold
Close.TextSize = 16

-- MINIMIZE BUTTON
Min.Parent = Title
Min.Size = UDim2.new(0,30,0,30)
Min.Position = UDim2.new(1,-60,0,0)
Min.Text = "_"
Min.BackgroundColor3 = Color3.fromRGB(90,90,90)
Min.TextColor3 = Color3.fromRGB(255,255,255)
Min.Font = Enum.Font.SourceSansBold
Min.TextSize = 18

-- SCROLLING FRAME
ScrollingFrame.Parent = Frame
ScrollingFrame.Position = UDim2.new(0,10,0,40)
ScrollingFrame.Size = UDim2.new(1,-20,1,-50)
ScrollingFrame.CanvasSize = UDim2.new(0,0,0,0)
ScrollingFrame.ScrollBarImageTransparency = 0.2
ScrollingFrame.BorderSizePixel = 0
ScrollingFrame.BackgroundTransparency = 1
ScrollingFrame.AutomaticCanvasSize = Enum.AutomaticSize.None

-- NOTE TEXT
Note.Parent = ScrollingFrame
Note.Size = UDim2.new(1,-10,0,0)
Note.BackgroundTransparency = 1
Note.TextWrapped = true
Note.TextYAlignment = Enum.TextYAlignment.Top
Note.TextXAlignment = Enum.TextXAlignment.Left
Note.Font = Enum.Font.SourceSans
Note.TextSize = 14
Note.TextColor3 = Color3.fromRGB(230,230,230)

-- 📌 ISI CATATAN
Note.Text = [[
📌 TRIK RNG FISH IT (CATATAN PRIBADI)

🔹 TRIK PERTAMA: 0–500 IKAN
Target:
• 2 Legend / 1 Mitos
Aturan:
• Kalau lebih dari 3 Legend
  (sebelum 500 atau pas 500)
➡️ RESP AWN / RESET SERVER

🔹 TRIK KEDUA: 500–1500 IKAN
Target:
• 1 Mitos
Aturan:
• Jika tidak dapat Mitos
• Legend bertambah jadi 3
➡️ RESP AWN

🔹 TRIK KETIGA: 1500–4500 IKAN
Aturan:
• Jika sampai 4000 ikan
• Hanya dapat Legend tanpa Mitos
➡️ RESP AWN AJA

⚠️ CATATAN TAMBAHAN
Gua lebih sering cuma sampai fase ke-2.
Kalau tetap gagal dapat Secret:
• Reset server / Respawn
• Jual ikan
• Jalanin fase 1 & 2 lagi

(READ ONLY)
]]

-- AUTO RESIZE TEXT + SCROLL
task.wait()
Note.Size = UDim2.new(1,-10,0,Note.TextBounds.Y + 10)
ScrollingFrame.CanvasSize = UDim2.new(0,0,0,Note.TextBounds.Y + 20)

-- RESIZE HANDLE
Resize.Parent = Frame
Resize.Size = UDim2.new(0,18,0,18)
Resize.Position = UDim2.new(1,-18,1,-18)
Resize.BackgroundColor3 = Color3.fromRGB(120,120,120)

-- MINIMIZE LOGIC
local minimized = false
local oldSize = Frame.Size

Min.MouseButton1Click:Connect(function()
    minimized = not minimized
    if minimized then
        oldSize = Frame.Size
        Frame.Size = UDim2.new(oldSize.X.Scale,oldSize.X.Offset,0,30)
        ScrollingFrame.Visible = false
        Resize.Visible = false
    else
        Frame.Size = oldSize
        ScrollingFrame.Visible = true
        Resize.Visible = true
    end
end)

-- CLOSE
Close.MouseButton1Click:Connect(function()
    ScreenGui:Destroy()
end)

-- RESIZE LOGIC (TOUCH ANDROID)
local resizing = false

Resize.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.Touch then
        resizing = true
    end
end)

UIS.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.Touch then
        resizing = false
    end
end)

UIS.InputChanged:Connect(function(input)
    if resizing and input.UserInputType == Enum.UserInputType.Touch then
        Frame.Size = Frame.Size + UDim2.new(0,input.Delta.X,0,input.Delta.Y)
    end
end)
