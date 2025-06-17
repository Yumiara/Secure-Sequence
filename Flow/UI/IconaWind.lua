local a;
a = {
    cache = {},
    load = function(b)
        if not a.cache[b] then
            a.cache[b] = {
                c = a[b]()
            };
        end;
        return a.cache[b].c;
    end
};
do
    a.a = function()
        local f = GG.Load_Icona();
        f.SetIconsType("lucide");
        local g = {
            Font = "rbxassetid://12187365364",
            CanDraggable = true,
            Theme = nil,
            Themes = nil,
            WindUI = nil,
            Signals = {},
            Objects = {},
            FontObjects = {},
            Request = request,
            DefaultProperties = {
                ScreenGui = {
                    ResetOnSpawn = false,
                    ZIndexBehavior = "Sibling"
                },
                CanvasGroup = {
                    BorderSizePixel = 0,
                    BackgroundColor3 = Col3new(1, 1, 1)
                },
                Frame = {
                    BorderSizePixel = 0,
                    BackgroundColor3 = Col3new(1, 1, 1)
                },
                TextLabel = {
                    BackgroundColor3 = Col3new(1, 1, 1),
                    BorderSizePixel = 0,
                    Text = "",
                    RichText = true,
                    TextColor3 = Col3new(1, 1, 1),
                    TextSize = 14
                },
                TextButton = {
                    BackgroundColor3 = Col3new(1, 1, 1),
                    BorderSizePixel = 0,
                    Text = "",
                    AutoButtonColor = false,
                    TextColor3 = Col3new(1, 1, 1),
                    TextSize = 14
                },
                TextBox = {
                    BackgroundColor3 = Col3new(1, 1, 1),
                    BorderColor3 = Col3new(0, 0, 0),
                    ClearTextOnFocus = false,
                    Text = "",
                    TextColor3 = Col3new(0, 0, 0),
                    TextSize = 14
                },
                ImageLabel = {
                    BackgroundTransparency = 1,
                    BackgroundColor3 = Col3new(1, 1, 1),
                    BorderSizePixel = 0
                },
                ImageButton = {
                    BackgroundColor3 = Col3new(1, 1, 1),
                    BorderSizePixel = 0,
                    AutoButtonColor = false
                },
                UIListLayout = {
                    SortOrder = "LayoutOrder"
                }
            },
            Colors = {
                Red = "#e53935",
                Orange = "#f57c00",
                Green = "#43a047",
                Blue = "#039be5",
                White = "#ffffff",
                Grey = "#484848"
            }
        };
        g.Init = function(h)
            g.WindUI = h;
        end;
        g.AddSignal = function(h, i)
            tablein(g.Signals, h:Connect(i));
        end;
        g.DisconnectAll = function()
            for h, i in next, g.Signals do
                local j = tabler(g.Signals, h);
                j:Disconnect();
            end;
        end;
        g.SafeCallback = function(h, ...)
            if not h then
                return;
            end;
            
            if true then
                return h(...);
            end;

            local i, j = pcal(h, ...);
            if not i then
                local k, l = j:find(":%d+: ");
                warn("[ WindUI: DEBUG Mode ] " .. j);
                return g.WindUI:Notify({
                    Title = "DEBUG Mode: Error",
                    Content = not l and j or j:sub(l + 1),
                    Duration = 8
                });
            end;
        end;
        g.SetTheme = function(h)
            g.Theme = h;
            g.UpdateTheme(nil, true);
        end;
        g.AddFontObject = function(h)
            tablein(g.FontObjects, h);
            g.UpdateFont(g.Font);
        end;
        g.UpdateFont = function(h)
            g.Font = h;
            for i, j in next, g.FontObjects do
                j.FontFace = Fnew(h, j.FontFace.Weight, j.FontFace.Style);
            end;
        end;
        g.GetThemeProperty = function(h, i)
            return i[h] or g.Themes.Dark[h];
        end;
        g.AddThemeObject = function(h, i)
            g.Objects[h] = {
                Object = h,
                Properties = i
            };
            g.UpdateTheme(h, false);
            return h;
        end;
        g.UpdateTheme = function(h, i)
            local function ApplyTheme(j)
                for k, l in pir(j.Properties or {}) do
                    local m = g.GetThemeProperty(l, g.Theme);
                    if m then
                        if not i then
                            j.Object[k] = fromHex(m);
                        else
                            g.Tween(j.Object, 0.08, {
                                [k] = fromHex(m)
                            }):Play();
                        end;
                    end;
                end;
            end
            if h then
                local j = g.Objects[h];
                if j then
                    ApplyTheme(j);
                end;
            else
                for j, k in pir(g.Objects) do
                    ApplyTheme(k);
                end;
            end;
        end;
        g.Icon = function(h)
            return f.Icon(h);
        end;
        g.New = function(h, i, j)
            local k = Instancen(h);
            for l, m in next, g.DefaultProperties[h] or {} do
                k[l] = m;
            end;
            for n, o in next, i or {} do
                if n ~= "ThemeTag" then
                    k[n] = o;
                end;
            end;
            for p, q in next, j or {} do
                q.Parent = k;
            end;
            if i and i.ThemeTag then
                g.AddThemeObject(k, i.ThemeTag);
            end;
            if i and i.FontFace then
                g.AddFontObject(k);
            end;
            return k;
        end;
        g.Tween = function(h, i, j, ...)
            return TweenService:Create(h, TwInfo(i, ...), j);
        end;
        g.NewRoundFrame = function(h, i, j, k, n)
            local o = g.New(n and "ImageButton" or "ImageLabel", {
                Image = i == "Squircle" and "rbxassetid://80999662900595" or i == "SquircleOutline" and "rbxassetid://117788349049947" or i == "Shadow-sm" and "rbxassetid://84825982946844" or i == "Squircle-TL-TR" and "rbxassetid://73569156276236",
                ScaleType = "Slice",
                SliceCenter = i ~= "Shadow-sm" and Rectn(256, 256, 256, 256) or Rectn(512, 512, 512, 512),
                SliceScale = 1,
                BackgroundTransparency = 1,
                ThemeTag = j.ThemeTag and j.ThemeTag
            }, k);
            for p, q in pir(j or {}) do
                if p ~= "ThemeTag" then
                    o[p] = q;
                end;
            end;
            local function UpdateSliceScale(r)
                local s = i ~= "Shadow-sm" and (r / (256)) or (r / 512);
                o.SliceScale = s;
            end
            UpdateSliceScale(h);
            return o;
        end;
        local h = g.New;
        local i = g.Tween;
        g.SetDraggable = function(j)
            g.CanDraggable = j;
        end;
        g.Drag = function(j, k, n)
            local o;
            local p, q, r, s;
            local t = {
                CanDraggable = true
            };
            if not k or type(k) ~= "table" then
                k = {
                    j
                };
            end;
            local function update(u)
                local v = u.Position - r;
                g.Tween(j, 0.02, {
                    Position = Dim2(s.X.Scale, s.X.Offset + v.X, s.Y.Scale, s.Y.Offset + v.Y)
                }):Play();
            end
            for u, v in pir(k) do
                v.InputBegan:Connect(function(w)
                    if (w.UserInputType == Enum.UserInputType.MouseButton1 or w.UserInputType == Enum.UserInputType.Touch) and t.CanDraggable then
                        if o == nil then
                            o = v;
                            p = true;
                            r = w.Position;
                            s = j.Position;
                            if n and type(n) == "function" then
                                n(true, o);
                            end;
                            w.Changed:Connect(function()
                                if w.UserInputState == Enum.UserInputState.End then
                                    p = false;
                                    o = nil;
                                    if n and type(n) == "function" then
                                        n(false, o);
                                    end;
                                end;
                            end);
                        end;
                    end;
                end);
                v.InputChanged:Connect(function(w)
                    if o == v and p then
                        if w.UserInputType == Enum.UserInputType.MouseMovement or w.UserInputType == Enum.UserInputType.Touch then
                            q = w;
                        end;
                    end;
                end);
            end;
            UserInputService.InputChanged:Connect(function(w)
                if w == q and p and o ~= nil then
                    if t.CanDraggable then
                        update(w);
                    end;
                end;
            end);
            t.Set = function(w, x)
                t.CanDraggable = x;
            end;
            return t;
        end;
        g.Image = function(j, k, n, o, p, q, r)
            local function SanitizeFilename(s)
                s = s:gsub("[%s/\\:*?\"<>|]+", "-");
                s = s:gsub("[^%w%-_%.]", "");
                return s;
            end
            k = SanitizeFilename(k);
            local s = h("Frame", {
                Size = Dim2(0, 0, 0, 0),
                BackgroundTransparency = 1
            }, {
                h("ImageLabel", {
                    Size = Dim2(1, 0, 1, 0),
                    BackgroundTransparency = 1,
                    ScaleType = "Crop",
                    ThemeTag = (g.Icon(j) or r) and {
                        ImageColor3 = q and "Icon"
                    } or nil
                }, {
                    h("UICorner", {
                        CornerRadius = Dim(0, n)
                    })
                })
            });
            if g.Icon(j) then
                s.ImageLabel.Image = g.Icon(j)[1];
                s.ImageLabel.ImageRectOffset = g.Icon(j)[2].ImageRectPosition;
                s.ImageLabel.ImageRectSize = g.Icon(j)[2].ImageRectSize;
            end;
            if strfind(j, "http") then
                local t = "WindUI/" .. o .. "/Assets/." .. p .. "-" .. k .. ".png";
                local u, v = pcal(function()
                    tspawn(function()
                        if not isfile(t) then
                            local u = g.Request({
                                Url = j,
                                Method = "GET"
                            }).Body;
                            writefile(t, u);
                        end;
                        s.ImageLabel.Image = getcustomasset(t);
                    end);
                end);
                if not u then
                    warn("[ WindUI.Creator ]  '" .. identifyexecutor() .. "' doesnt support the URL Images. Error: " .. v);
                    --s:Destroy();
                end;
            else
                if strfind(j, "rbxassetid") then
                    s.ImageLabel.Image = j;
                end;
            end;
            return s;
        end;
        return g;
    end;
    a.b = function()
        return {
            Dark = {
                Name = "Dark",
                Accent = "#18181b",
                Outline = "#FFFFFF",
                Text = "#FFFFFF",
                Placeholder = "#999999",
                Background = "#0e0e10",
                Button = "#52525b",
                Icon = "#a1a1aa"
            },
            Light = {
                Name = "Light",
                Accent = "#FFFFFF",
                Outline = "#09090b",
                Text = "#000000",
                Placeholder = "#777777",
                Background = "#e4e4e7",
                Button = "#18181b",
                Icon = "#a1a1aa"
            },
            Rose = {
                Name = "Rose",
                Accent = "#881337",
                Outline = "#FFFFFF",
                Text = "#FFFFFF",
                Placeholder = "#6B7280",
                Background = "#4c0519",
                Button = "#52525b",
                Icon = "#a1a1aa"
            },
            Plant = {
                Name = "Plant",
                Accent = "#365314",
                Outline = "#FFFFFF",
                Text = "#e6ffe5",
                Placeholder = "#7d977d",
                Background = "#1a2e05",
                Button = "#52525b",
                Icon = "#a1a1aa"
            },
            Red = {
                Name = "Red",
                Accent = "#7f1d1d",
                Outline = "#FFFFFF",
                Text = "#ffeded",
                Placeholder = "#977d7d",
                Background = "#450a0a",
                Button = "#52525b",
                Icon = "#a1a1aa"
            },
            Indigo = {
                Name = "Indigo",
                Accent = "#312e81",
                Outline = "#FFFFFF",
                Text = "#ffeded",
                Placeholder = "#977d7d",
                Background = "#1e1b4b",
                Button = "#52525b",
                Icon = "#a1a1aa"
            }
        };
    end;
    a.c = function()
        local b = {};
        local d = {
            lua = {
                "and",
                "break",
                "or",
                "else",
                "elseif",
                "if",
                "then",
                "until",
                "repeat",
                "while",
                "do",
                "for",
                "in",
                "end",
                "local",
                "return",
                "function",
                "export"
            },
            rbx = {
                "game",
                "workspace",
                "script",
                "math",
                "string",
                "table",
                "task",
                "wait",
                "select",
                "next",
                "Enum",
                "tick",
                "assert",
                "shared",
                "loadstring",
                "ton",
                "tostring",
                "type",
                "typeof",
                "unpack",
                "Instance",
                "CFrame",
                "Vector3",
                "Vector2",
                "Color3",
                "UDim",
                "UDim2",
                "Ray",
                "BrickColor",
                "OverlapParams",
                "RaycastParams",
                "Axes",
                "Random",
                "Region3",
                "Rect",
                "TweenInfo",
                "collectgarbage",
                "not",
                "utf8",
                "pcal",
                "xpcal",
                "_G",
                "setmetatable",
                "getmetatable",
                "os",
                "pir",
                "ipir"
            },
            operators = {
                "#",
                "+",
                "-",
                "*",
                "%",
                "/",
                "^",
                "=",
                "~",
                "=",
                "<",
                ">"
            }
        };
        local e = {
            numbers = fromHex("#FAB387"),
            boolean = fromHex("#FAB387"),
            operator = fromHex("#94E2D5"),
            lua = fromHex("#CBA6F7"),
            rbx = fromHex("#F38BA8"),
            str = fromHex("#A6E3A1"),
            comment = fromHex("#9399B2"),
            null = fromHex("#F38BA8"),
            call = fromHex("#89B4FA"),
            self_call = fromHex("#89B4FA"),
            local_property = fromHex("#CBA6F7")
        };
        local function createKeywordSet(f)
            local g = {};
            for h, i in ipir(f) do
                g[i] = true;
            end;
            return g;
        end
        local f = createKeywordSet(d.lua);
        local g = createKeywordSet(d.rbx);
        local h = createKeywordSet(d.operators);
        local function getHighlight(i, j)
            local k = i[j];
            if e[k .. "_color"] then
                return e[k .. "_color"];
            end;
            if ton(k) then
                return e.numbers;
            else
                if k == "nil" then
                    return e.null;
                else
                    if k:sub(1, 2) == "--" then
                        return e.comment;
                    else
                        if h[k] then
                            return e.operator;
                        else
                            if f[k] then
                                return e.lua;
                            else
                                if g[k] then
                                    return e.rbx;
                                else
                                    if k:sub(1, 1) == "\"" or k:sub(1, 1) == "'" then
                                        return e.str;
                                    else
                                        if k == "true" or k == "false" then
                                            return e.boolean;
                                        end;
                                    end;
                                end;
                            end;
                        end;
                    end;
                end;
            end;
            if i[j + 1] == "(" then
                if i[j - 1] == ":" then
                    return e.self_call;
                end;
                return e.call;
            end;
            if i[j - 1] == "." then
                if i[j - 2] == "Enum" then
                    return e.rbx;
                end;
                return e.local_property;
            end;
        end
        b.run = function(i)
            local j = {};
            local k = "";
            local n = false;
            local o = false;
            local p = false;
            for q = 1, #i do
                local r = i:sub(q, q);
                if o then
                    if r == "\n" and not p then
                        tablein(j, k);
                        tablein(j, r);
                        k = "";
                        o = false;
                    else
                        if i:sub(q - 1, q) == "]]" and p then
                            k ..= "]";
                            tablein(j, k);
                            k = "";
                            o = false;
                            p = false;
                        else
                            k = k .. r;
                        end;
                    end;
                else
                    if n then
                        if r == n and i:sub(q - 1, q - 1) ~= "\\" or r == "\n" then
                            k = k .. r;
                            n = false;
                        else
                            k = k .. r;
                        end;
                    else
                        if i:sub(q, q + 1) == "--" then
                            tablein(j, k);
                            k = "-";
                            o = true;
                            p = i:sub(q + 2, q + 3) == "[[";
                        else
                            if r == "\"" or r == "'" then
                                tablein(j, k);
                                k = r;
                                n = r;
                            else
                                if h[r] then
                                    tablein(j, k);
                                    tablein(j, r);
                                    k = "";
                                else
                                    if r:match("[%w_]") then
                                        k = k .. r;
                                    else
                                        tablein(j, k);
                                        tablein(j, r);
                                        k = "";
                                    end;
                                end;
                            end;
                        end;
                    end;
                end;
            end;
            tablein(j, k);
            local q = {};
            for r, s in ipir(j) do
                local t = getHighlight(j, r);
                if t then
                    local u = strformat("<font color = \"#%s\">%s</font>", t:ToHex(), s:gsub("<", "&lt;"):gsub(">", "&gt;"));
                    tablein(q, u);
                else
                    tablein(q, s);
                end;
            end;
            return tconcat(q);
        end;
        return b;
    end;
    a.d = function()
        local b = game:GetService("UserInputService");
        game:GetService("TweenService");
        local d = a.load("c");
        local e = {};
        local f = a.load("a");
        local g = f.New;
        local h = f.Tween;
        e.Button = function(i, j, k, n, o, p)
            n = n or "Primary";
            local q = 10;
            local r;
            if j and j ~= "" then
                r = g("ImageLabel", {
                    Image = f.Icon(j)[1],
                    ImageRectSize = f.Icon(j)[2].ImageRectSize,
                    ImageRectOffset = f.Icon(j)[2].ImageRectPosition,
                    Size = Dim2(0, 21, 0, 21),
                    BackgroundTransparency = 1,
                    ThemeTag = {
                        ImageColor3 = "Icon"
                    }
                });
            end;
            local s = g("TextButton", {
                Size = Dim2(0, 0, 1, 0),
                AutomaticSize = "X",
                Parent = o,
                BackgroundTransparency = 1
            }, {
                f.NewRoundFrame(q, "Squircle", {
                    ThemeTag = {
                        ImageColor3 = n ~= "White" and "Button" or nil
                    },
                    ImageColor3 = n == "White" and Col3new(1, 1, 1) or nil,
                    Size = Dim2(1, 0, 1, 0),
                    Name = "Squircle",
                    ImageTransparency = n == "Primary" and 0 or n == "White" and 0 or 1
                }),
                f.NewRoundFrame(q, "Squircle", {
                    ImageColor3 = Col3new(1, 1, 1),
                    Size = Dim2(1, 0, 1, 0),
                    Name = "Special",
                    ImageTransparency = n == "Secondary" and 0.95 or 1
                }),
                f.NewRoundFrame(q, "Shadow-sm", {
                    ImageColor3 = Col3new(0, 0, 0),
                    Size = Dim2(1, 3, 1, 3),
                    AnchorPoint = Vec2(0.5, 0.5),
                    Position = Dim2(0.5, 0, 0.5, 0),
                    Name = "Shadow",
                    ImageTransparency = n == "Secondary" and 0 or 1
                }),
                f.NewRoundFrame(q, "SquircleOutline", {
                    ThemeTag = {
                        ImageColor3 = n ~= "White" and "Outline" or nil
                    },
                    Size = Dim2(1, 0, 1, 0),
                    ImageColor3 = n == "White" and Col3new(0, 0, 0) or nil,
                    ImageTransparency = n == "Primary" and 0.95 or 0.85
                }),
                f.NewRoundFrame(q, "Squircle", {
                    Size = Dim2(1, 0, 1, 0),
                    Name = "Frame",
                    ThemeTag = {
                        ImageColor3 = n ~= "White" and "Text" or nil
                    },
                    ImageColor3 = n == "White" and Col3new(0, 0, 0) or nil,
                    ImageTransparency = 1
                }, {
                    g("UIPadding", {
                        PaddingLeft = Dim(0, 12),
                        PaddingRight = Dim(0, 12)
                    }),
                    g("UIListLayout", {
                        FillDirection = "Horizontal",
                        Padding = Dim(0, 8),
                        VerticalAlignment = "Center",
                        HorizontalAlignment = "Center"
                    }),
                    r,
                    g("TextLabel", {
                        BackgroundTransparency = 1,
                        FontFace = Fnew(f.Font, Enum.FontWeight.SemiBold),
                        Text = i or "Button",
                        ThemeTag = {
                            TextColor3 = (n ~= "Primary" and n ~= "White") and "Text"
                        },
                        TextColor3 = n == "Primary" and Col3new(1, 1, 1) or n == "White" and Col3new(0, 0, 0) or nil,
                        AutomaticSize = "XY",
                        TextSize = 18
                    })
                })
            });
            f.AddSignal(s.MouseEnter, function()
                h(s.Frame, 0.047, {
                    ImageTransparency = 0.95
                }):Play();
            end);
            f.AddSignal(s.MouseLeave, function()
                h(s.Frame, 0.047, {
                    ImageTransparency = 1
                }):Play();
            end);
            f.AddSignal(s.MouseButton1Up, function()
                if p then
                    p:Close()();
                end;
                if k then
                    f.SafeCallback(k);
                end;
            end);
            return s;
        end;
        e.Input = function(i, j, k, n, o)
            n = n or "Input";
            local p = 10;
            local q;
            if j and j ~= "" then
                q = g("ImageLabel", {
                    Image = f.Icon(j)[1],
                    ImageRectSize = f.Icon(j)[2].ImageRectSize,
                    ImageRectOffset = f.Icon(j)[2].ImageRectPosition,
                    Size = Dim2(0, 21, 0, 21),
                    BackgroundTransparency = 1,
                    ThemeTag = {
                        ImageColor3 = "Icon"
                    }
                });
            end;
            local r = g("TextBox", {
                BackgroundTransparency = 1,
                TextSize = 16,
                FontFace = Fnew(f.Font, Enum.FontWeight.Regular),
                Size = Dim2(1, q and -29 or 0, 1, 0),
                PlaceholderText = i,
                ClearTextOnFocus = false,
                ClipsDescendants = true,
                MultiLine = n == "Input" and false or true,
                TextWrapped = n == "Input" and false or true,
                TextXAlignment = "Left",
                TextYAlignment = n == "Input" and "Center" or "Top",
                ThemeTag = {
                    PlaceholderColor3 = "PlaceholderText",
                    TextColor3 = "Text"
                }
            });
            local s = g("Frame", {
                Size = Dim2(1, 0, 0, 42),
                Parent = k,
                BackgroundTransparency = 1
            }, {
                g("Frame", {
                    Size = Dim2(1, 0, 1, 0),
                    BackgroundTransparency = 1
                }, {
                    f.NewRoundFrame(p, "Squircle", {
                        ThemeTag = {
                            ImageColor3 = "Accent"
                        },
                        Size = Dim2(1, 0, 1, 0),
                        ImageTransparency = 0.45
                    }),
                    f.NewRoundFrame(p, "SquircleOutline", {
                        ThemeTag = {
                            ImageColor3 = "Outline"
                        },
                        Size = Dim2(1, 0, 1, 0),
                        ImageTransparency = 0.9
                    }),
                    f.NewRoundFrame(p, "Squircle", {
                        Size = Dim2(1, 0, 1, 0),
                        Name = "Frame",
                        ImageColor3 = Col3new(1, 1, 1),
                        ImageTransparency = 0.95
                    }, {
                        g("UIPadding", {
                            PaddingTop = Dim(0, n == "Input" and 0 or 12),
                            PaddingLeft = Dim(0, 12),
                            PaddingRight = Dim(0, 12),
                            PaddingBottom = Dim(0, n == "Input" and 0 or 12)
                        }),
                        g("UIListLayout", {
                            FillDirection = "Horizontal",
                            Padding = Dim(0, 8),
                            VerticalAlignment = n == "Input" and "Center" or "Top",
                            HorizontalAlignment = "Left"
                        }),
                        q,
                        r
                    })
                })
            });
            f.AddSignal(r.FocusLost, function()
                if o then
                    f.SafeCallback(o, r.Text);
                end;
            end);
            return s;
        end;
        e.Label = function(i, j, k)
            local n = 10;
            local o;
            if j and j ~= "" then
                o = g("ImageLabel", {
                    Image = f.Icon(j)[1],
                    ImageRectSize = f.Icon(j)[2].ImageRectSize,
                    ImageRectOffset = f.Icon(j)[2].ImageRectPosition,
                    Size = Dim2(0, 21, 0, 21),
                    BackgroundTransparency = 1,
                    ThemeTag = {
                        ImageColor3 = "Icon"
                    }
                });
            end;
            local p = g("TextLabel", {
                BackgroundTransparency = 1,
                TextSize = 16,
                FontFace = Fnew(f.Font, Enum.FontWeight.Regular),
                Size = Dim2(1, o and -29 or 0, 1, 0),
                TextXAlignment = "Left",
                ThemeTag = {
                    TextColor3 = "Text"
                },
                Text = i
            });
            local q = g("TextButton", {
                Size = Dim2(1, 0, 0, 42),
                Parent = k,
                BackgroundTransparency = 1,
                Text = ""
            }, {
                g("Frame", {
                    Size = Dim2(1, 0, 1, 0),
                    BackgroundTransparency = 1
                }, {
                    f.NewRoundFrame(n, "Squircle", {
                        ThemeTag = {
                            ImageColor3 = "Accent"
                        },
                        Size = Dim2(1, 0, 1, 0),
                        ImageTransparency = 0.45
                    }),
                    f.NewRoundFrame(n, "SquircleOutline", {
                        ThemeTag = {
                            ImageColor3 = "Outline"
                        },
                        Size = Dim2(1, 0, 1, 0),
                        ImageTransparency = 0.9
                    }),
                    f.NewRoundFrame(n, "Squircle", {
                        Size = Dim2(1, 0, 1, 0),
                        Name = "Frame",
                        ImageColor3 = Col3new(1, 1, 1),
                        ImageTransparency = 0.95
                    }, {
                        g("UIPadding", {
                            PaddingLeft = Dim(0, 12),
                            PaddingRight = Dim(0, 12)
                        }),
                        g("UIListLayout", {
                            FillDirection = "Horizontal",
                            Padding = Dim(0, 8),
                            VerticalAlignment = "Center",
                            HorizontalAlignment = "Left"
                        }),
                        o,
                        p
                    })
                })
            });
            return q;
        end;
        e.Toggle = function(i, j, k, n)
            local o = {};
            local p = 13;
            local q;
            if j and j ~= "" then
                q = g("ImageLabel", {
                    Size = Dim2(1, -7, 1, -7),
                    BackgroundTransparency = 1,
                    AnchorPoint = Vec2(0.5, 0.5),
                    Position = Dim2(0.5, 0, 0.5, 0),
                    Image = f.Icon(j)[1],
                    ImageRectOffset = f.Icon(j)[2].ImageRectPosition,
                    ImageRectSize = f.Icon(j)[2].ImageRectSize,
                    ImageTransparency = 1,
                    ImageColor3 = Col3new(0, 0, 0)
                });
            end;
            local r = f.NewRoundFrame(p, "Squircle", {
                ImageTransparency = 0.95,
                ThemeTag = {
                    ImageColor3 = "Text"
                },
                Parent = k,
                Size = Dim2(0, 42, 0, 26)
            }, {
                f.NewRoundFrame(p, "Squircle", {
                    Size = Dim2(1, 0, 1, 0),
                    Name = "Layer",
                    ThemeTag = {
                        ImageColor3 = "Button"
                    },
                    ImageTransparency = 1
                }),
                f.NewRoundFrame(p, "SquircleOutline", {
                    Size = Dim2(1, 0, 1, 0),
                    Name = "Stroke",
                    ImageColor3 = Col3new(1, 1, 1),
                    ImageTransparency = 1
                }, {
                    g("UIGradient", {
                        Rotation = 90,
                        Transparency = NSnew({
                            NSKnew(0, 0),
                            NSKnew(1, 1)
                        })
                    })
                }),
                f.NewRoundFrame(p, "Squircle", {
                    Size = Dim2(0, 18, 0, 18),
                    Position = Dim2(0, 3, 0.5, 0),
                    AnchorPoint = Vec2(0, 0.5),
                    ImageTransparency = 0,
                    ImageColor3 = Col3new(1, 1, 1),
                    Name = "Frame"
                }, {
                    q
                })
            });
            o.Set = function(s, t)
                if t then
                    h(r.Frame, 0.1, {
                        Position = Dim2(1, -22, 0.5, 0)
                    }, Enum.EasingStyle.Quint, Enum.EasingDirection.Out):Play();
                    h(r.Layer, 0.1, {
                        ImageTransparency = 0
                    }):Play();
                    h(r.Stroke, 0.1, {
                        ImageTransparency = 0.95
                    }):Play();
                    if q then
                        h(q, 0.1, {
                            ImageTransparency = 0
                        }):Play();
                    end;
                else
                    h(r.Frame, 0.1, {
                        Position = Dim2(0, 4, 0.5, 0),
                        Size = Dim2(0, 18, 0, 18)
                    }, Enum.EasingStyle.Quint, Enum.EasingDirection.Out):Play();
                    h(r.Layer, 0.1, {
                        ImageTransparency = 1
                    }):Play();
                    h(r.Stroke, 0.1, {
                        ImageTransparency = 1
                    }):Play();
                    if q then
                        h(q, 0.1, {
                            ImageTransparency = 1
                        }):Play();
                    end;
                end;
                tspawn(function()
                    if n then
                        f.SafeCallback(n, t);
                    end;
                end);
            end;
            return r, o;
        end;
        e.Checkbox = function(i, j, k, n)
            local o = {};
            j = j or "check";
            local p = 10;
            local q = g("ImageLabel", {
                Size = Dim2(1, -10, 1, -10),
                BackgroundTransparency = 1,
                AnchorPoint = Vec2(0.5, 0.5),
                Position = Dim2(0.5, 0, 0.5, 0),
                Image = f.Icon(j)[1],
                ImageRectOffset = f.Icon(j)[2].ImageRectPosition,
                ImageRectSize = f.Icon(j)[2].ImageRectSize,
                ImageTransparency = 1,
                ImageColor3 = Col3new(1, 1, 1)
            });
            local r = f.NewRoundFrame(p, "Squircle", {
                ImageTransparency = 0.95,
                ThemeTag = {
                    ImageColor3 = "Text"
                },
                Parent = k,
                Size = Dim2(0, 27, 0, 27)
            }, {
                f.NewRoundFrame(p, "Squircle", {
                    Size = Dim2(1, 0, 1, 0),
                    Name = "Layer",
                    ThemeTag = {
                        ImageColor3 = "Button"
                    },
                    ImageTransparency = 1
                }),
                f.NewRoundFrame(p, "SquircleOutline", {
                    Size = Dim2(1, 0, 1, 0),
                    Name = "Stroke",
                    ImageColor3 = Col3new(1, 1, 1),
                    ImageTransparency = 1
                }, {
                    g("UIGradient", {
                        Rotation = 90,
                        Transparency = NSnew({
                            NSKnew(0, 0),
                            NSKnew(1, 1)
                        })
                    })
                }),
                q
            });
            o.Set = function(s, t)
                if t then
                    h(r.Layer, 0.06, {
                        ImageTransparency = 0
                    }):Play();
                    h(r.Stroke, 0.06, {
                        ImageTransparency = 0.95
                    }):Play();
                    h(q, 0.06, {
                        ImageTransparency = 0
                    }):Play();
                else
                    h(r.Layer, 0.05, {
                        ImageTransparency = 1
                    }):Play();
                    h(r.Stroke, 0.05, {
                        ImageTransparency = 1
                    }):Play();
                    h(q, 0.06, {
                        ImageTransparency = 1
                    }):Play();
                end;
                tspawn(function()
                    if n then
                        f.SafeCallback(n, t);
                    end;
                end);
            end;
            return r, o;
        end;
        e.ScrollSlider = function(i, j, k, n)
            local o = g("Frame", {
                Size = Dim2(0, n, 1, 0),
                BackgroundTransparency = 1,
                Position = Dim2(1, 0, 0, 0),
                AnchorPoint = Vec2(1, 0),
                Parent = j,
                ZIndex = 999,
                Active = true
            });
            local p = f.NewRoundFrame(n / 2, "Squircle", {
                Size = Dim2(1, 0, 0, 0),
                ImageTransparency = 0.85,
                ThemeTag = {
                    ImageColor3 = "Text"
                },
                Parent = o
            });
            local q = g("Frame", {
                Size = Dim2(1, 12, 1, 12),
                Position = Dim2(0.5, 0, 0.5, 0),
                AnchorPoint = Vec2(0.5, 0.5),
                BackgroundTransparency = 1,
                Active = true,
                ZIndex = 999,
                Parent = p
            });
            local r = false;
            local s = 0;
            local function updateSliderSize()
                local t = i;
                local u = t.AbsoluteCanvasSize.Y;
                local v = t.AbsoluteWindowSize.Y;
                if u <= v then
                    p.Visible = false;
                    return;
                end;
                local w = mclamp(v / u, 0.1, 1);
                p.Size = Dim2(1, 0, w, 0);
                p.Visible = true;
            end
            local function updateScrollingFramePosition()
                local t = p.Position.Y.Scale;
                local u = i.AbsoluteCanvasSize.Y;
                local v = i.AbsoluteWindowSize.Y;
                local w = mmax(u - v, 0);
                if w <= 0 then
                    return;
                end;
                local x = mmax(1 - p.Size.Y.Scale, 0);
                if x <= 0 then
                    return;
                end;
                local y = t / x;
                i.CanvasPosition = Vec2(i.CanvasPosition.X, y * w);
            end
            local function updateThumbPosition()
                if r then
                    return;
                end;
                local t = i.CanvasPosition.Y;
                local u = i.AbsoluteCanvasSize.Y;
                local v = i.AbsoluteWindowSize.Y;
                local w = mmax(u - v, 0);
                if w <= 0 then
                    p.Position = Dim2(0, 0, 0, 0);
                    return;
                end;
                local x = t / w;
                local y = mmax(1 - p.Size.Y.Scale, 0);
                local z = mclamp(x * y, 0, y);
                p.Position = Dim2(0, 0, z, 0);
            end
            f.AddSignal(o.InputBegan, function(t)
                if (t.UserInputType == Enum.UserInputType.MouseButton1 or t.UserInputType == Enum.UserInputType.Touch) then
                    local u = p.AbsolutePosition.Y;
                    local v = u + p.AbsoluteSize.Y;
                    if not (t.Position.Y >= u and t.Position.Y <= v) then
                        local w = o.AbsolutePosition.Y;
                        local x = o.AbsoluteSize.Y;
                        local y = p.AbsoluteSize.Y;
                        local z = t.Position.Y - w - y / 2;
                        local A = x - y;
                        local B = mclamp(z / A, 0, 1 - p.Size.Y.Scale);
                        p.Position = Dim2(0, 0, B, 0);
                        updateScrollingFramePosition();
                    end;
                end;
            end);
            f.AddSignal(q.InputBegan, function(t)
                if t.UserInputType == Enum.UserInputType.MouseButton1 or t.UserInputType == Enum.UserInputType.Touch then
                    r = true;
                    s = t.Position.Y - p.AbsolutePosition.Y;
                    local u;
                    local v;
                    u = UserInputService.InputChanged:Connect(function(w)
                        if w.UserInputType == Enum.UserInputType.MouseMovement or w.UserInputType == Enum.UserInputType.Touch then
                            local x = o.AbsolutePosition.Y;
                            local y = o.AbsoluteSize.Y;
                            local z = p.AbsoluteSize.Y;
                            local A = w.Position.Y - x - s;
                            local B = y - z;
                            local C = mclamp(A / B, 0, 1 - p.Size.Y.Scale);
                            p.Position = Dim2(0, 0, C, 0);
                            updateScrollingFramePosition();
                        end;
                    end);
                    v = UserInputService.InputEnded:Connect(function(w)
                        if w.UserInputType == Enum.UserInputType.MouseButton1 or w.UserInputType == Enum.UserInputType.Touch then
                            r = false;
                            if u then
                                u:Disconnect();
                            end;
                            if v then
                                v:Disconnect();
                            end;
                        end;
                    end);
                end;
            end);
            f.AddSignal(i:GetPropertyChangedSignal("AbsoluteWindowSize"), function()
                updateSliderSize();
                updateThumbPosition();
            end);
            f.AddSignal(i:GetPropertyChangedSignal("AbsoluteCanvasSize"), function()
                updateSliderSize();
                updateThumbPosition();
            end);
            f.AddSignal(i:GetPropertyChangedSignal("CanvasPosition"), function()
                if not r then
                    updateThumbPosition();
                end;
            end);
            updateSliderSize();
            updateThumbPosition();
            return o;
        end;
        e.ToolTip = function(i, j)
            local k = {
                Container = nil,
                ToolTipSize = 16
            };
            local n = g("TextLabel", {
                AutomaticSize = "XY",
                TextWrapped = true,
                BackgroundTransparency = 1,
                FontFace = Fnew(f.Font, Enum.FontWeight.Medium),
                Text = i,
                TextSize = 17,
                ThemeTag = {
                    TextColor3 = "Text"
                }
            });
            local o = g("UIScale", {
                Scale = 0.9
            });
            local p = g("CanvasGroup", {
                AnchorPoint = Vec2(0.5, 0),
                AutomaticSize = "XY",
                BackgroundTransparency = 1,
                Parent = j,
                GroupTransparency = 1,
                Visible = false
            }, {
                g("UISizeConstraint", {
                    MaxSize = Vec2(400, math.huge)
                }),
                g("Frame", {
                    AutomaticSize = "XY",
                    BackgroundTransparency = 1,
                    LayoutOrder = 99,
                    Visible = false
                }, {
                    g("ImageLabel", {
                        Size = Dim2(0, k.ToolTipSize, 0, k.ToolTipSize / 2),
                        BackgroundTransparency = 1,
                        Rotation = 180,
                        Image = "rbxassetid://89524607682719",
                        ThemeTag = {
                            ImageColor3 = "Accent"
                        }
                    }, {
                        g("ImageLabel", {
                            Size = Dim2(0, k.ToolTipSize, 0, k.ToolTipSize / 2),
                            BackgroundTransparency = 1,
                            LayoutOrder = 99,
                            ImageTransparency = 0.9,
                            Image = "rbxassetid://89524607682719",
                            ThemeTag = {
                                ImageColor3 = "Text"
                            }
                        })
                    })
                }),
                g("Frame", {
                    AutomaticSize = "XY",
                    ThemeTag = {
                        BackgroundColor3 = "Accent"
                    }
                }, {
                    g("UICorner", {
                        CornerRadius = Dim(0, 16)
                    }),
                    g("Frame", {
                        ThemeTag = {
                            BackgroundColor3 = "Text"
                        },
                        AutomaticSize = "XY",
                        BackgroundTransparency = 0.9
                    }, {
                        g("UICorner", {
                            CornerRadius = Dim(0, 16)
                        }),
                        g("UIListLayout", {
                            Padding = Dim(0, 12),
                            FillDirection = "Horizontal",
                            VerticalAlignment = "Center"
                        }),
                        n,
                        g("UIPadding", {
                            PaddingTop = Dim(0, 12),
                            PaddingLeft = Dim(0, 12),
                            PaddingRight = Dim(0, 12),
                            PaddingBottom = Dim(0, 12)
                        })
                    })
                }),
                o,
                g("UIListLayout", {
                    Padding = Dim(0, 0),
                    FillDirection = "Vertical",
                    VerticalAlignment = "Center",
                    HorizontalAlignment = "Center"
                })
            });
            k.Container = p;
            k.Open = function(q)
                p.Visible = true;
                h(p, 0.16, {
                    GroupTransparency = 0
                }, Enum.EasingStyle.Quint, Enum.EasingDirection.Out):Play();
                h(o, 0.18, {
                    Scale = 1
                }, Enum.EasingStyle.Quint, Enum.EasingDirection.Out):Play();
            end;
            k.Close = function(q)
                h(p, 0.2, {
                    GroupTransparency = 1
                }, Enum.EasingStyle.Quint, Enum.EasingDirection.Out):Play();
                h(o, 0.2, {
                    Scale = 0.9
                }, Enum.EasingStyle.Quint, Enum.EasingDirection.Out):Play();
                twait(0.25);
                p.Visible = false;
                p:Destroy();
            end;
            return k;
        end;
        e.Code = function(i, j, k, n)
            local o = {
                Radius = 12,
                Padding = 10
            };
            local p = g("TextLabel", {
                Text = "",
                TextColor3 = fromHex("#CDD6F4"),
                TextTransparency = 0,
                TextSize = 14,
                TextWrapped = false,
                LineHeight = 1.15,
                RichText = true,
                TextXAlignment = "Left",
                Size = Dim2(0, 0, 0, 0),
                BackgroundTransparency = 1,
                AutomaticSize = "XY"
            }, {
                g("UIPadding", {
                    PaddingTop = Dim(0, o.Padding + 3),
                    PaddingLeft = Dim(0, o.Padding + 3),
                    PaddingRight = Dim(0, o.Padding + 3),
                    PaddingBottom = Dim(0, o.Padding + 3)
                })
            });
            p.Font = "Code";
            local q = g("ScrollingFrame", {
                Size = Dim2(1, 0, 0, 0),
                BackgroundTransparency = 1,
                AutomaticCanvasSize = "X",
                ScrollingDirection = "X",
                ElasticBehavior = "Never",
                CanvasSize = Dim2(0, 0, 0, 0),
                ScrollBarThickness = 0
            }, {
                p
            });
            local r = g("TextButton", {
                BackgroundTransparency = 1,
                Size = Dim2(0, 30, 0, 30),
                Position = Dim2(1, -o.Padding / 2, 0, o.Padding / 2),
                AnchorPoint = Vec2(1, 0),
                Visible = n and true or false
            }, {
                f.NewRoundFrame(o.Radius - 4, "Squircle", {
                    ImageColor3 = fromHex("#ffffff"),
                    ImageTransparency = 1,
                    Size = Dim2(1, 0, 1, 0),
                    AnchorPoint = Vec2(0.5, 0.5),
                    Position = Dim2(0.5, 0, 0.5, 0),
                    Name = "Button"
                }, {
                    g("UIScale", {
                        Scale = 1
                    }),
                    g("ImageLabel", {
                        Image = f.Icon("copy")[1],
                        ImageRectSize = f.Icon("copy")[2].ImageRectSize,
                        ImageRectOffset = f.Icon("copy")[2].ImageRectPosition,
                        BackgroundTransparency = 1,
                        AnchorPoint = Vec2(0.5, 0.5),
                        Position = Dim2(0.5, 0, 0.5, 0),
                        Size = Dim2(0, 12, 0, 12),
                        ImageColor3 = fromHex("#ffffff"),
                        ImageTransparency = 0.1
                    })
                })
            });
            f.AddSignal(r.MouseEnter, function()
                h(r.Button, 0.05, {
                    ImageTransparency = 0.95
                }):Play();
                h(r.Button.UIScale, 0.05, {
                    Scale = 0.9
                }):Play();
            end);
            f.AddSignal(r.InputEnded, function()
                h(r.Button, 0.08, {
                    ImageTransparency = 1
                }):Play();
                h(r.Button.UIScale, 0.08, {
                    Scale = 1
                }):Play();
            end);
            f.NewRoundFrame(o.Radius, "Squircle", {
                ImageColor3 = fromHex("#212121"),
                ImageTransparency = 0.035,
                Size = Dim2(1, 0, 0, 20 + (o.Padding * 2)),
                AutomaticSize = "Y",
                Parent = k
            }, {
                f.NewRoundFrame(o.Radius, "SquircleOutline", {
                    Size = Dim2(1, 0, 1, 0),
                    ImageColor3 = fromHex("#ffffff"),
                    ImageTransparency = 0.955
                }),
                g("Frame", {
                    BackgroundTransparency = 1,
                    Size = Dim2(1, 0, 0, 0),
                    AutomaticSize = "Y"
                }, {
                    f.NewRoundFrame(o.Radius, "Squircle-TL-TR", {
                        ImageColor3 = fromHex("#ffffff"),
                        ImageTransparency = 0.96,
                        Size = Dim2(1, 0, 0, 20 + (o.Padding * 2)),
                        Visible = j and true or false
                    }, {
                        g("ImageLabel", {
                            Size = Dim2(0, 18, 0, 18),
                            BackgroundTransparency = 1,
                            Image = "rbxassetid://132464694294269",
                            ImageColor3 = fromHex("#ffffff"),
                            ImageTransparency = 0.2
                        }),
                        g("TextLabel", {
                            Text = j,
                            TextColor3 = fromHex("#ffffff"),
                            TextTransparency = 0.2,
                            TextSize = 16,
                            AutomaticSize = "Y",
                            FontFace = Fnew(f.Font, Enum.FontWeight.Medium),
                            TextXAlignment = "Left",
                            BackgroundTransparency = 1,
                            TextTruncate = "AtEnd",
                            Size = Dim2(1, r and -20 - (o.Padding * 2), 0, 0)
                        }),
                        g("UIPadding", {
                            PaddingLeft = Dim(0, o.Padding + 3),
                            PaddingRight = Dim(0, o.Padding + 3)
                        }),
                        g("UIListLayout", {
                            Padding = Dim(0, o.Padding),
                            FillDirection = "Horizontal",
                            VerticalAlignment = "Center"
                        })
                    }),
                    q,
                    g("UIListLayout", {
                        Padding = Dim(0, 0),
                        FillDirection = "Vertical"
                    })
                }),
                r
            });
            f.AddSignal(p:GetPropertyChangedSignal("TextBounds"), function()
                q.Size = Dim2(1, 0, 0, p.TextBounds.Y + ((o.Padding + 3) * 2));
            end);
            o.Set = function(s)
                p.Text = d.run(s);
            end;
            o.Set(i);
            f.AddSignal(r.MouseButton1Click, function()
                if n then
                    n();
                    local s = f.Icon("check");
                    r.Button.ImageLabel.Image = s[1];
                    r.Button.ImageLabel.ImageRectSize = s[2].ImageRectSize;
                    r.Button.ImageLabel.ImageRectOffset = s[2].ImageRectPosition;
                end;
            end);
            return o;
        end;
        return e;
    end;
    a.e = function()
        local b = a.load("a");
        local d = b.New;
        local e = b.Tween;
        local f = {
            UICorner = 14,
            UIPadding = 12,
            Holder = nil,
            Window = nil
        };
        f.Init = function(g)
            f.Window = g;
            return f;
        end;
        f.Create = function(g)
            local h = {
                UICorner = 19,
                UIPadding = 16,
                UIElements = {}
            };
            if g then
                h.UIPadding = 0;
            end;
            if g then
                h.UICorner = 22;
            end;
            if not g then
                h.UIElements.FullScreen = d("Frame", {
                    ZIndex = 999,
                    BackgroundTransparency = 1,
                    BackgroundColor3 = fromHex("#2a2a2a"),
                    Size = Dim2(1, 0, 1, 0),
                    Active = false,
                    Visible = false,
                    Parent = g and f.Window or f.Window.UIElements.Main.Main
                }, {
                    d("UICorner", {
                        CornerRadius = Dim(0, f.Window.UICorner)
                    })
                });
            end;
            h.UIElements.Main = d("Frame", {
                ThemeTag = {
                    BackgroundColor3 = "Accent"
                },
                AutomaticSize = "XY",
                BackgroundTransparency = 1,
                Visible = false,
                ZIndex = 99999
            }, {
                d("UIPadding", {
                    PaddingTop = Dim(0, h.UIPadding),
                    PaddingLeft = Dim(0, h.UIPadding),
                    PaddingRight = Dim(0, h.UIPadding),
                    PaddingBottom = Dim(0, h.UIPadding)
                })
            });
            h.UIElements.MainContainer = b.NewRoundFrame(h.UICorner, "Squircle", {
                Visible = false,
                ImageTransparency = g and 0.15 or 0,
                Parent = g and f.Window or h.UIElements.FullScreen,
                Position = Dim2(0.5, 0, 0.5, 0),
                AnchorPoint = Vec2(0.5, 0.5),
                AutomaticSize = "XY",
                ThemeTag = {
                    ImageColor3 = "Accent"
                },
                ZIndex = 9999
            }, {
                h.UIElements.Main,
                d("UIScale", {
                    Scale = 0.9
                }),
                b.NewRoundFrame(h.UICorner, "SquircleOutline", {
                    Size = Dim2(1, 0, 1, 0),
                    ImageTransparency = 1,
                    ThemeTag = {
                        ImageColor3 = "Outline"
                    }
                }, {
                    d("UIGradient", {
                        Rotation = 90,
                        Transparency = NSnew({
                            NSKnew(0, 0),
                            NSKnew(1, 1)
                        })
                    })
                })
            });
            h.Open = function(i)
                if not g then
                    h.UIElements.FullScreen.Visible = true;
                    h.UIElements.FullScreen.Active = true;
                end;
                tspawn(function()
                    h.UIElements.MainContainer.Visible = true;
                    if not g then
                        e(h.UIElements.FullScreen, 0.1, {
                            BackgroundTransparency = 0.5
                        }):Play();
                    end;
                    e(h.UIElements.MainContainer, 0.1, {
                        ImageTransparency = 0
                    }):Play();
                    e(h.UIElements.MainContainer.UIScale, 0.1, {
                        Scale = 1
                    }):Play();
                    tspawn(function()
                        twait(0.05);
                        h.UIElements.Main.Visible = true;
                    end);
                end);
            end;
            h.Close = function(i)
                if not g then
                    e(h.UIElements.FullScreen, 0.1, {
                        BackgroundTransparency = 1
                    }):Play();
                    h.UIElements.FullScreen.Active = false;
                    tspawn(function()
                        twait(0.1);
                        h.UIElements.FullScreen.Visible = false;
                    end);
                end;
                h.UIElements.Main.Visible = false;
                e(h.UIElements.MainContainer, 0.1, {
                    ImageTransparency = 1
                }):Play();
                e(h.UIElements.MainContainer.UIScale, 0.1, {
                    Scale = 0.9
                }):Play();
                tspawn(function()
                    twait(0.1);
                    if not g then
                        h.UIElements.FullScreen:Destroy();
                    else
                        h.UIElements.MainContainer:Destroy();
                    end;
                end);
                return function()
                end;
            end;
            return h;
        end;
        return f;
    end;
    a.f = function()
        local b = {};
        local d = a.load("a");
        local e = d.New;
        local f = d.Tween;
        local g = a.load("d");
        local h = g.Button;
        local i = g.Input;
        b.new = function(j, k, n)
            local o = a.load("e").Init(j.WindUI.ScreenGui.KeySystem);
            local p = o.Create(true);
            local q;
            local r = 200;
            local s = 430;
            if j.KeySystem.Thumbnail and j.KeySystem.Thumbnail.Image then
                s = 430 + (r / 2);
            end;
            p.UIElements.Main.AutomaticSize = "Y";
            p.UIElements.Main.Size = Dim2(0, s, 0, 0);
            local t;
            if j.Icon then
                t = d.Image(j.Icon, j.Title .. ":" .. j.Icon, 0, j.WindUI.Window, "KeySystem", j.IconThemed);
                t.Size = Dim2(0, 24, 0, 24);
                t.LayoutOrder = -1;
            end;
            local u = e("TextLabel", {
                AutomaticSize = "XY",
                BackgroundTransparency = 1,
                Text = j.Title,
                FontFace = Fnew(d.Font, Enum.FontWeight.SemiBold),
                ThemeTag = {
                    TextColor3 = "Text"
                },
                TextSize = 20
            });
            local v = e("TextLabel", {
                AutomaticSize = "XY",
                BackgroundTransparency = 1,
                Text = "Key System",
                AnchorPoint = Vec2(1, 0.5),
                Position = Dim2(1, 0, 0.5, 0),
                TextTransparency = 1,
                FontFace = Fnew(d.Font, Enum.FontWeight.Medium),
                ThemeTag = {
                    TextColor3 = "Text"
                },
                TextSize = 16
            });
            local w = e("Frame", {
                BackgroundTransparency = 1,
                AutomaticSize = "XY"
            }, {
                e("UIListLayout", {
                    Padding = Dim(0, 14),
                    FillDirection = "Horizontal",
                    VerticalAlignment = "Center"
                }),
                t,
                u
            });
            local x = e("Frame", {
                AutomaticSize = "Y",
                Size = Dim2(1, 0, 0, 0),
                BackgroundTransparency = 1
            }, {
                w,
                v
            });
            local y = i("Enter Key", "key", nil, nil, function(y)
                q = y;
            end);
            local z;
            if j.KeySystem.Note and j.KeySystem.Note ~= "" then
                z = e("TextLabel", {
                    Size = Dim2(1, 0, 0, 0),
                    AutomaticSize = "Y",
                    FontFace = Fnew(d.Font, Enum.FontWeight.Medium),
                    TextXAlignment = "Left",
                    Text = j.KeySystem.Note,
                    TextSize = 18,
                    TextTransparency = 0.4,
                    ThemeTag = {
                        TextColor3 = "Text"
                    },
                    BackgroundTransparency = 1,
                    RichText = true
                });
            end;
            local A = e("Frame", {
                Size = Dim2(1, 0, 0, 42),
                BackgroundTransparency = 1
            }, {
                e("Frame", {
                    BackgroundTransparency = 1,
                    AutomaticSize = "X",
                    Size = Dim2(0, 0, 1, 0)
                }, {
                    e("UIListLayout", {
                        Padding = Dim(0, 9),
                        FillDirection = "Horizontal"
                    })
                })
            });
            local B;
            if j.KeySystem.Thumbnail and j.KeySystem.Thumbnail.Image then
                local C;
                if j.KeySystem.Thumbnail.Title then
                    C = e("TextLabel", {
                        Text = j.KeySystem.Thumbnail.Title,
                        ThemeTag = {
                            TextColor3 = "Text"
                        },
                        TextSize = 18,
                        FontFace = Fnew(d.Font, Enum.FontWeight.Medium),
                        BackgroundTransparency = 1,
                        AutomaticSize = "XY",
                        AnchorPoint = Vec2(0.5, 0.5),
                        Position = Dim2(0.5, 0, 0.5, 0)
                    });
                end;
                B = e("ImageLabel", {
                    Image = j.KeySystem.Thumbnail.Image,
                    BackgroundTransparency = 1,
                    Size = Dim2(0, r, 1, 0),
                    Parent = p.UIElements.Main,
                    ScaleType = "Crop"
                }, {
                    C,
                    e("UICorner", {
                        CornerRadius = Dim(0, 0)
                    })
                });
            end;
            e("Frame", {
                Size = Dim2(1, B and -r or 0, 1, 0),
                Position = Dim2(0, B and r or 0, 0, 0),
                BackgroundTransparency = 1,
                Parent = p.UIElements.Main
            }, {
                e("Frame", {
                    Size = Dim2(1, 0, 1, 0),
                    BackgroundTransparency = 1
                }, {
                    e("UIListLayout", {
                        Padding = Dim(0, 18),
                        FillDirection = "Vertical"
                    }),
                    x,
                    z,
                    y,
                    A,
                    e("UIPadding", {
                        PaddingTop = Dim(0, 16),
                        PaddingLeft = Dim(0, 16),
                        PaddingRight = Dim(0, 16),
                        PaddingBottom = Dim(0, 16)
                    })
                })
            });
            local C = h("Exit", "log-out", function()
                p:Close()();
            end, "Tertiary", A.Frame);
            if B then
                C.Parent = B;
                C.Size = Dim2(0, 0, 0, 42);
                C.Position = Dim2(0, 16, 1, -16);
                C.AnchorPoint = Vec2(0, 1);
            end;
            if j.KeySystem.URL then
                h("Get key", "key", function()
                    setclipboard(j.KeySystem.URL);
                end, "Secondary", A.Frame);
            end;
            local D = h("Submit", "arrow-right", function()
                local D = q;
                local E;
                if type(j.KeySystem.Key) == "table" then
                    E = tablef(j.KeySystem.Key, tos(D));
                else
                    E = tos(j.KeySystem.Key) == tos(D);
                end;
                if E then
                    p:Close()();
                    if j.KeySystem.SaveKey then
                        local F = j.Folder or j.Title;
                        writefile(F .. "/" .. k .. ".key", tos(D));
                    end;
                    twait(0.4);
                    n(true);
                end;
            end, "Primary", A);
            D.AnchorPoint = Vec2(1, 0.5);
            D.Position = Dim2(1, 0, 0.5, 0);
            p:Open();
        end;
        return b;
    end;
    a.g = function()
        local b = a.load("a");
        local d = b.New;
        local e = b.Tween;
        local f = {
            Size = Dim2(0, 300, 1, -156),
            SizeLower = Dim2(0, 300, 1, -56),
            UICorner = 16,
            UIPadding = 14,
            ButtonPadding = 9,
            Holder = nil,
            NotificationIndex = 0,
            Notifications = {}
        };
        f.Init = function(g)
            local h = {
                Lower = false
            };
            h.SetLower = function(i)
                h.Lower = i;
                h.Frame.Size = i and f.SizeLower or f.Size;
            end;
            h.Frame = d("Frame", {
                Position = Dim2(1, -29, 0, 56),
                AnchorPoint = Vec2(1, 0),
                Size = f.Size,
                Parent = g,
                BackgroundTransparency = 1
            }, {
                d("UIListLayout", {
                    HorizontalAlignment = "Center",
                    SortOrder = "LayoutOrder",
                    VerticalAlignment = "Bottom",
                    Padding = Dim(0, 8)
                }),
                d("UIPadding", {
                    PaddingBottom = Dim(0, 29)
                })
            });
            return h;
        end;
        f.New = function(g)
            local h = {
                Title = g.Title or "Notification",
                Content = g.Content or nil,
                Icon = g.Icon or nil,
                IconThemed = g.IconThemed,
                Background = g.Background,
                BackgroundImageTransparency = g.BackgroundImageTransparency,
                Duration = g.Duration or 5,
                Buttons = g.Buttons or {},
                CanClose = true,
                UIElements = {},
                Closed = false
            };
            if h.CanClose == nil then
                h.CanClose = true;
            end;
            f.NotificationIndex = f.NotificationIndex + 1;
            f.Notifications[f.NotificationIndex] = h;
            local i = d("UICorner", {
                CornerRadius = Dim(0, f.UICorner)
            });
            local j = d("UIStroke", {
                ThemeTag = {
                    Color = "Text"
                },
                Transparency = 1,
                Thickness = 0.6
            });
            local k;
            if h.Icon then
                k = b.Image(h.Icon, h.Title .. ":" .. h.Icon, 0, g.Window, "Notification", h.IconThemed);
                k.Size = Dim2(0, 26, 0, 26);
                k.Position = Dim2(0, f.UIPadding, 0, f.UIPadding);
            end;
            local n;
            if h.CanClose then
                n = d("ImageButton", {
                    Image = b.Icon("x")[1],
                    ImageRectSize = b.Icon("x")[2].ImageRectSize,
                    ImageRectOffset = b.Icon("x")[2].ImageRectPosition,
                    BackgroundTransparency = 1,
                    Size = Dim2(0, 16, 0, 16),
                    Position = Dim2(1, -f.UIPadding, 0, f.UIPadding),
                    AnchorPoint = Vec2(1, 0),
                    ThemeTag = {
                        ImageColor3 = "Text"
                    }
                }, {
                    d("TextButton", {
                        Size = Dim2(1, 8, 1, 8),
                        BackgroundTransparency = 1,
                        AnchorPoint = Vec2(0.5, 0.5),
                        Position = Dim2(0.5, 0, 0.5, 0),
                        Text = ""
                    })
                });
            end;
            local o = d("Frame", {
                Size = Dim2(1, 0, 0, 3),
                BackgroundTransparency = 0.9,
                ThemeTag = {
                    BackgroundColor3 = "Text"
                }
            });
            local p = d("Frame", {
                Size = Dim2(1, h.Icon and -28 - f.UIPadding or 0, 1, 0),
                Position = Dim2(1, 0, 0, 0),
                AnchorPoint = Vec2(1, 0),
                BackgroundTransparency = 1,
                AutomaticSize = "Y"
            }, {
                d("UIPadding", {
                    PaddingTop = Dim(0, f.UIPadding),
                    PaddingLeft = Dim(0, f.UIPadding),
                    PaddingRight = Dim(0, f.UIPadding),
                    PaddingBottom = Dim(0, f.UIPadding)
                }),
                d("TextLabel", {
                    AutomaticSize = "Y",
                    Size = Dim2(1, -30 - f.UIPadding, 0, 0),
                    TextWrapped = true,
                    TextXAlignment = "Left",
                    RichText = true,
                    BackgroundTransparency = 1,
                    TextSize = 16,
                    ThemeTag = {
                        TextColor3 = "Text"
                    },
                    Text = h.Title,
                    FontFace = Fnew(b.Font, Enum.FontWeight.SemiBold)
                }),
                d("UIListLayout", {
                    Padding = Dim(0, f.UIPadding / 3)
                })
            });
            if h.Content then
                d("TextLabel", {
                    AutomaticSize = "Y",
                    Size = Dim2(1, 0, 0, 0),
                    TextWrapped = true,
                    TextXAlignment = "Left",
                    RichText = true,
                    BackgroundTransparency = 1,
                    TextTransparency = 0.4,
                    TextSize = 15,
                    ThemeTag = {
                        TextColor3 = "Text"
                    },
                    Text = h.Content,
                    FontFace = Fnew(b.Font, Enum.FontWeight.Medium),
                    Parent = p
                });
            end;
            local q = d("CanvasGroup", {
                Size = Dim2(1, 0, 0, 0),
                Position = Dim2(2, 0, 1, 0),
                AnchorPoint = Vec2(0, 1),
                AutomaticSize = "Y",
                BackgroundTransparency = 0.25,
                ThemeTag = {
                    BackgroundColor3 = "Accent"
                }
            }, {
                d("ImageLabel", {
                    Name = "Background",
                    Image = h.Background,
                    BackgroundTransparency = 1,
                    Size = Dim2(1, 0, 1, 0),
                    ScaleType = "Crop",
                    ImageTransparency = h.BackgroundImageTransparency
                }),
                j,
                i,
                p,
                k,
                n,
                o
            });
            local r = d("Frame", {
                BackgroundTransparency = 1,
                Size = Dim2(1, 0, 0, 0),
                Parent = g.Holder
            }, {
                q
            });
            h.Close = function(s)
                if not h.Closed then
                    h.Closed = true;
                    e(r, 0.45, {
                        Size = Dim2(1, 0, 0, -8)
                    }, Enum.EasingStyle.Quint, Enum.EasingDirection.Out):Play();
                    e(q, 0.55, {
                        Position = Dim2(2, 0, 1, 0)
                    }, Enum.EasingStyle.Quint, Enum.EasingDirection.Out):Play();
                    twait(0.45);
                    r:Destroy();
                end;
            end;
            tspawn(function()
                twait();
                e(r, 0.45, {
                    Size = Dim2(1, 0, 0, q.AbsoluteSize.Y)
                }, Enum.EasingStyle.Quint, Enum.EasingDirection.Out):Play();
                e(q, 0.45, {
                    Position = Dim2(0, 0, 1, 0)
                }, Enum.EasingStyle.Quint, Enum.EasingDirection.Out):Play();
                if h.Duration then
                    e(o, h.Duration, {
                        Size = Dim2(0, 0, 0, 3)
                    }, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut):Play();
                    twait(h.Duration);
                    h:Close();
                end;
            end);
            if n then
                b.AddSignal(n.TextButton.MouseButton1Click, function()
                    h:Close();
                end);
            end;
            return h;
        end;
        return f;
    end;
    a.h = function()
        local b = {};
        local d = a.load("a");
        local e = d.New;
        local f = d.Tween;
        b.new = function(g)
            local h = {
                Title = g.Title or "Dialog",
                Content = g.Content,
                Icon = g.Icon,
                IconThemed = g.IconThemed,
                Thumbnail = g.Thumbnail,
                Buttons = g.Buttons
            };
            local i = a.load("e").Init(g.WindUI.ScreenGui.Popups);
            local j = i.Create(true);
            local k = 200;
            local n = 430;
            if h.Thumbnail and h.Thumbnail.Image then
                n = 430 + (k / 2);
            end;
            j.UIElements.Main.AutomaticSize = "Y";
            j.UIElements.Main.Size = Dim2(0, n, 0, 0);
            local o;
            if h.Icon then
                o = d.Image(h.Icon, h.Title .. ":" .. h.Icon, 0, g.WindUI.Window, "Popup", g.IconThemed);
                o.Size = Dim2(0, 24, 0, 24);
                o.LayoutOrder = -1;
            end;
            local p = e("TextLabel", {
                AutomaticSize = "XY",
                BackgroundTransparency = 1,
                Text = h.Title,
                TextXAlignment = "Left",
                FontFace = Fnew(d.Font, Enum.FontWeight.SemiBold),
                ThemeTag = {
                    TextColor3 = "Text"
                },
                TextSize = 20
            });
            local q = e("Frame", {
                BackgroundTransparency = 1,
                AutomaticSize = "XY"
            }, {
                e("UIListLayout", {
                    Padding = Dim(0, 14),
                    FillDirection = "Horizontal",
                    VerticalAlignment = "Center"
                }),
                o,
                p
            });
            local r = e("Frame", {
                AutomaticSize = "Y",
                Size = Dim2(1, 0, 0, 0),
                BackgroundTransparency = 1
            }, {
                q
            });
            local s;
            if h.Content and h.Content ~= "" then
                s = e("TextLabel", {
                    Size = Dim2(1, 0, 0, 0),
                    AutomaticSize = "Y",
                    FontFace = Fnew(d.Font, Enum.FontWeight.Medium),
                    TextXAlignment = "Left",
                    Text = h.Content,
                    TextSize = 18,
                    TextTransparency = 0.2,
                    ThemeTag = {
                        TextColor3 = "Text"
                    },
                    BackgroundTransparency = 1,
                    RichText = true
                });
            end;
            local t = e("Frame", {
                Size = Dim2(1, 0, 0, 42),
                BackgroundTransparency = 1
            }, {
                e("UIListLayout", {
                    Padding = Dim(0, 9),
                    FillDirection = "Horizontal",
                    HorizontalAlignment = "Right"
                })
            });
            local u;
            if h.Thumbnail and h.Thumbnail.Image then
                local v;
                if h.Thumbnail.Title then
                    v = e("TextLabel", {
                        Text = h.Thumbnail.Title,
                        ThemeTag = {
                            TextColor3 = "Text"
                        },
                        TextSize = 18,
                        FontFace = Fnew(d.Font, Enum.FontWeight.Medium),
                        BackgroundTransparency = 1,
                        AutomaticSize = "XY",
                        AnchorPoint = Vec2(0.5, 0.5),
                        Position = Dim2(0.5, 0, 0.5, 0)
                    });
                end;
                u = e("ImageLabel", {
                    Image = h.Thumbnail.Image,
                    BackgroundTransparency = 1,
                    Size = Dim2(0, k, 1, 0),
                    Parent = j.UIElements.Main,
                    ScaleType = "Crop"
                }, {
                    v,
                    e("UICorner", {
                        CornerRadius = Dim(0, 0)
                    })
                });
            end;
            e("Frame", {
                Size = Dim2(1, u and -k or 0, 1, 0),
                Position = Dim2(0, u and k or 0, 0, 0),
                BackgroundTransparency = 1,
                Parent = j.UIElements.Main
            }, {
                e("Frame", {
                    Size = Dim2(1, 0, 1, 0),
                    BackgroundTransparency = 1
                }, {
                    e("UIListLayout", {
                        Padding = Dim(0, 18),
                        FillDirection = "Vertical"
                    }),
                    r,
                    s,
                    t,
                    e("UIPadding", {
                        PaddingTop = Dim(0, 16),
                        PaddingLeft = Dim(0, 16),
                        PaddingRight = Dim(0, 16),
                        PaddingBottom = Dim(0, 16)
                    })
                })
            });
            local v = a.load("d").Button;
            for w, x in next, h.Buttons do
                v(x.Title, x.Icon, x.Callback, x.Variant, t, j);
            end;
            j:Open();
            return h;
        end;
        return b;
    end;
    a.i = function()
        local b = game:GetService("HttpService");
        local d;
        d = {
            Window = nil,
            Folder = nil,
            Configs = {},
            Parser = {
                Colorpicker = {
                    Save = function(e)
                        return {
                            __type = e.__type,
                            value = e.Default:ToHex(),
                            transparency = e.Transparency or nil
                        };
                    end,
                    Load = function(e, f)
                        if e then
                            e:Update(fromHex(f.value), f.transparency or nil);
                        end;
                    end
                },
                Dropdown = {
                    Save = function(e)
                        return {
                            __type = e.__type,
                            value = e.Value
                        };
                    end,
                    Load = function(e, f)
                        if e then
                            e:Select(f.value);
                        end;
                    end
                },
                Input = {
                    Save = function(e)
                        return {
                            __type = e.__type,
                            value = e.Value
                        };
                    end,
                    Load = function(e, f)
                        if e then
                            e:Set(f.value);
                        end;
                    end
                },
                Keybind = {
                    Save = function(e)
                        return {
                            __type = e.__type,
                            value = e.Value
                        };
                    end,
                    Load = function(e, f)
                        if e then
                            e:Set(f.value);
                        end;
                    end
                },
                Slider = {
                    Save = function(e)
                        return {
                            __type = e.__type,
                            value = e.Value.Default
                        };
                    end,
                    Load = function(e, f)
                        if e then
                            e:Set(f.value);
                        end;
                    end
                },
                Toggle = {
                    Save = function(e)
                        return {
                            __type = e.__type,
                            value = e.Value
                        };
                    end,
                    Load = function(e, f)
                        if e then
                            e:Set(f.value);
                        end;
                    end
                }
            }
        };
        d.Init = function(e, f)
            d.Window = f;
            d.Folder = f.Folder;
            return d;
        end;
        d.CreateConfig = function(e, f)
            local g = {
                Path = "WindUI/" .. d.Folder .. "/config/" .. f .. ".json",
                Elements = {}
            };
            if not f then
                return false, "No config file is selected";
            end;
            g.Register = function(h, i, j)
                g.Elements[i] = j;
            end;
            g.Save = function(h)
                local i = {
                    Elements = {}
                };
                for j, k in next, g.Elements do
                    if d.Parser[k.__type] then
                        i.Elements[tos(j)] = d.Parser[k.__type].Save(k);
                    end;
                end;
                print(b:JSONEncode(i));
                writefile(g.Path, b:JSONEncode(i));
            end;
            g.Load = function(h)
                if not isfile(g.Path) then
                    return false, "Invalid file";
                end;
                local i = b:JSONDecode(readfile(g.Path));
                for j, k in next, i.Elements do
                    if g.Elements[j] and d.Parser[k.__type] then
                        tspawn(function()
                            d.Parser[k.__type].Load(g.Elements[j], k);
                        end);
                    end;
                end;
            end;
            d.Configs[f] = g;
            return g;
        end;
        return d;
    end;
    a.j = function()
        local b = a.load("a");
        local d = b.New;
        local e = b.NewRoundFrame;
        local f = b.Tween;
        game:GetService("UserInputService");
        return function(g)
            local h = {
                Title = g.Title,
                Desc = g.Desc or nil,
                Hover = g.Hover,
                Thumbnail = g.Thumbnail,
                ThumbnailSize = g.ThumbnailSize or 80,
                Image = g.Image,
                IconThemed = g.IconThemed or false,
                ImageSize = g.ImageSize or 30,
                Color = g.Color,
                Scalable = g.Scalable,
                Parent = g.Parent,
                UIPadding = 12,
                UICorner = 13,
                UIElements = {}
            };
            local i = h.ImageSize;
            local j = h.ThumbnailSize;
            local k = true;
            local n = 0;
            local o;
            local p;
            if h.Thumbnail then
                o = b.Image(h.Thumbnail, h.Title, h.UICorner - 3, g.Window.Folder, "Thumbnail", false, h.IconThemed);
                o.Size = Dim2(1, 0, 0, j);
            end;
            if h.Image then
                p = b.Image(h.Image, h.Title, h.UICorner - 3, g.Window.Folder, "Image", h.Color and true or false);
                if h.Color == "White" then
                    p.ImageLabel.ImageColor3 = Col3new(0, 0, 0);
                else
                    if h.Color then
                        p.ImageLabel.ImageColor3 = Col3new(1, 1, 1);
                    end;
                end;
                p.Size = Dim2(0, i, 0, i);
                n = i;
            end;
            local function CreateText(q, r)
                return d("TextLabel", {
                    BackgroundTransparency = 1,
                    Text = q or "",
                    TextSize = r == "Desc" and 15 or 16,
                    TextXAlignment = "Left",
                    ThemeTag = {
                        TextColor3 = not h.Color and (r == "Desc" and "Icon" or "Text") or nil
                    },
                    TextColor3 = h.Color and (h.Color == "White" and Col3new(0, 0, 0) or h.Color ~= "White" and Col3new(1, 1, 1)) or nil,
                    TextTransparency = h.Color and (r == "Desc" and 0.3 or 0),
                    TextWrapped = true,
                    Size = Dim2(1, 0, 0, 0),
                    AutomaticSize = "Y",
                    FontFace = Fnew(b.Font, Enum.FontWeight.Medium)
                });
            end
            local q = CreateText(h.Title, "Title");
            local r = CreateText(h.Desc, "Desc");
            if not h.Desc or h.Desc == "" then
                r.Visible = false;
            end;
            h.UIElements.Container = d("Frame", {
                Size = Dim2(1, 0, 0, 0),
                AutomaticSize = "Y",
                BackgroundTransparency = 1
            }, {
                d("UIListLayout", {
                    Padding = Dim(0, h.UIPadding),
                    FillDirection = "Vertical",
                    VerticalAlignment = "Top",
                    HorizontalAlignment = "Left"
                }),
                o,
                d("Frame", {
                    Size = Dim2(1, -g.TextOffset, 0, 0),
                    AutomaticSize = "Y",
                    BackgroundTransparency = 1
                }, {
                    d("UIListLayout", {
                        Padding = Dim(0, h.UIPadding),
                        FillDirection = "Horizontal",
                        VerticalAlignment = "Top",
                        HorizontalAlignment = "Left"
                    }),
                    p,
                    d("Frame", {
                        BackgroundTransparency = 1,
                        AutomaticSize = "Y",
                        Size = Dim2(1, -n, 0, (50 - (h.UIPadding * 2)))
                    }, {
                        d("UIListLayout", {
                            Padding = Dim(0, 4),
                            FillDirection = "Vertical",
                            VerticalAlignment = "Center",
                            HorizontalAlignment = "Left"
                        }),
                        q,
                        r
                    })
                })
            });
            h.UIElements.Locked = e(h.UICorner, "Squircle", {
                Size = Dim2(1, h.UIPadding * 2, 1, h.UIPadding * 2),
                ImageTransparency = 0.4,
                AnchorPoint = Vec2(0.5, 0.5),
                Position = Dim2(0.5, 0, 0.5, 0),
                ImageColor3 = Col3new(0, 0, 0),
                Visible = false,
                Active = false,
                ZIndex = 9999999
            });
            h.UIElements.Main = e(h.UICorner, "Squircle", {
                Size = Dim2(1, 0, 0, 50),
                AutomaticSize = "Y",
                ImageTransparency = h.Color and 0.1 or 0.95,
                Parent = g.Parent,
                ThemeTag = {
                    ImageColor3 = not h.Color and "Text" or nil
                },
                ImageColor3 = h.Color and fromHex(b.Colors[h.Color]) or nil
            }, {
                h.UIElements.Container,
                h.UIElements.Locked,
                d("UIPadding", {
                    PaddingTop = Dim(0, h.UIPadding),
                    PaddingLeft = Dim(0, h.UIPadding),
                    PaddingRight = Dim(0, h.UIPadding),
                    PaddingBottom = Dim(0, h.UIPadding)
                })
            }, true);
            if h.Hover then
                b.AddSignal(h.UIElements.Main.MouseEnter, function()
                    if k then
                        f(h.UIElements.Main, 0.05, {
                            ImageTransparency = h.Color and 0.15 or 0.9
                        }):Play();
                    end;
                end);
                b.AddSignal(h.UIElements.Main.InputEnded, function()
                    if k then
                        f(h.UIElements.Main, 0.05, {
                            ImageTransparency = h.Color and 0.1 or 0.95
                        }):Play();
                    end;
                end);
            end;
            h.SetTitle = function(s, t)
                t.Text = t;
            end;
            h.SetDesc = function(s, t)
                r.Text = t or "";
                if not t then
                    r.Visible = false;
                else
                    if not r.Visible then
                        r.Visible = true;
                    end;
                end;
            end;
            h.Destroy = function(s)
                h.UIElements.Main:Destroy();
            end;
            h.Lock = function(s)
                k = false;
                h.UIElements.Locked.Active = true;
                h.UIElements.Locked.Visible = true;
            end;
            h.Unlock = function(s)
                k = true;
                h.UIElements.Locked.Active = false;
                h.UIElements.Locked.Visible = false;
            end;
            return h;
        end;
    end;
    a.k = function()
        local b = a.load("a");
        local d = b.New;
        local e = {};
        e.New = function(f, g)
            local h = {
                __type = "Button",
                Title = g.Title or "Button",
                Desc = g.Desc or nil,
                Locked = g.Locked or false,
                Callback = g.Callback or function()
                end,
                UIElements = {}
            };
            local i = true;
            h.ButtonFrame = a.load("j")({
                Title = h.Title,
                Desc = h.Desc,
                Parent = g.Parent,
                Window = g.Window,
                TextOffset = 20,
                Hover = true,
                Scalable = true
            });
            h.UIElements.ButtonIcon = d("ImageLabel", {
                Image = b.Icon("mouse-pointer-click")[1],
                ImageRectOffset = b.Icon("mouse-pointer-click")[2].ImageRectPosition,
                ImageRectSize = b.Icon("mouse-pointer-click")[2].ImageRectSize,
                BackgroundTransparency = 1,
                Parent = h.ButtonFrame.UIElements.Main,
                Size = Dim2(0, 20, 0, 20),
                AnchorPoint = Vec2(1, 0.5),
                Position = Dim2(1, 0, 0.5, 0),
                ThemeTag = {
                    ImageColor3 = "Text"
                }
            });
            h.Lock = function(j)
                i = false;
                return h.ButtonFrame:Lock();
            end;
            h.Unlock = function(j)
                i = true;
                return h.ButtonFrame:Unlock();
            end;
            if h.Locked then
                h:Lock();
            end;
            b.AddSignal(h.ButtonFrame.UIElements.Main.MouseButton1Click, function()
                if i then
                    tspawn(function()
                        b.SafeCallback(h.Callback);
                    end);
                end;
            end);
            return h.__type, h;
        end;
        return e;
    end;
    a.l = function()
        local b = a.load("a");
        local d = b.New;
        local e = b.Tween;
        local f = a.load("d");
        local g = f.Toggle;
        local h = f.Checkbox;
        local i = {};
        i.New = function(j, k)
            local n = {
                __type = "Toggle",
                Title = k.Title or "Toggle",
                Desc = k.Desc or nil,
                Value = k.Value,
                Icon = k.Icon or nil,
                Type = k.Type or "Toggle",
                Callback = k.Callback or function()
                end,
                UIElements = {}
            };
            n.ToggleFrame = a.load("j")({
                Title = n.Title,
                Desc = n.Desc,
                Window = k.Window,
                Parent = k.Parent,
                TextOffset = 44,
                Hover = false
            });
            local o = true;
            if n.Value == nil then
                n.Value = false;
            end;
            n.Lock = function(p)
                o = false;
                return n.ToggleFrame:Lock();
            end;
            n.Unlock = function(p)
                o = true;
                return n.ToggleFrame:Unlock();
            end;
            if n.Locked then
                n:Lock();
            end;
            local p = n.Value;
            local q, r;
            if n.Type == "Toggle" then
                q, r = g(p, n.Icon, n.ToggleFrame.UIElements.Main, n.Callback);
            else
                if n.Type == "Checkbox" then
                    q, r = h(p, n.Icon, n.ToggleFrame.UIElements.Main, n.Callback);
                else
                    error("Unknown Toggle Type: " .. tos(n.Type));
                end;
            end;
            q.AnchorPoint = Vec2(1, 0.5);
            q.Position = Dim2(1, 0, 0.5, 0);
            n.Set = function(s, t)
                if o then
                    r:Set(t);
                    p = t;
                    n.Value = t;
                end;
            end;
            n:Set(p);
            b.AddSignal(n.ToggleFrame.UIElements.Main.MouseButton1Click, function()
                n:Set(not p);
            end);
            return n.__type, n;
        end;
        return i;
    end;
    a.m = function()
        local b = a.load("a");
        local e = b.New;
        local f = b.Tween;
        local g = {};
        local h = false;
        g.New = function(i, j)
            local k = {
                __type = "Slider",
                Title = j.Title or "Slider",
                Desc = j.Desc or nil,
                Locked = j.Locked or nil,
                Value = j.Value or {},
                Step = j.Step or 1,
                Callback = j.Callback or function()
                end,
                UIElements = {},
                IsFocusing = false
            };
            local n;
            local o;
            local p;
            local q = k.Value.Default or k.Value.Min or 0;
            local r = q;
            local s = (q - (k.Value.Min or 0)) / ((k.Value.Max or 100) - (k.Value.Min or 0));
            local t = true;
            local u = k.Step % 1 ~= 0;
            local function FormatValue(v)
                if u then
                    return strformat("%.2f", v);
                else
                    return tos(mfloor(v + 0.5));
                end;
            end
            local function CalculateValue(v)
                if u then
                    return mfloor(v / k.Step + 0.5) * k.Step;
                else
                    return mfloor(v / k.Step + 0.5) * k.Step;
                end;
            end
            k.SliderFrame = a.load("j")({
                Title = k.Title,
                Desc = k.Desc,
                Parent = j.Parent,
                TextOffset = 0,
                Hover = false
            });
            k.UIElements.SliderIcon = b.NewRoundFrame(99, "Squircle", {
                ImageTransparency = 0.95,
                Size = Dim2(1, -68, 0, 4),
                Name = "Frame",
                ThemeTag = {
                    ImageColor3 = "Text"
                }
            }, {
                b.NewRoundFrame(99, "Squircle", {
                    Name = "Frame",
                    Size = Dim2(s, 0, 1, 0),
                    ImageTransparency = 0.1,
                    ThemeTag = {
                        ImageColor3 = "Button"
                    }
                }, {
                    b.NewRoundFrame(99, "Squircle", {
                        Size = Dim2(0, 13, 0, 13),
                        Position = Dim2(1, 0, 0.5, 0),
                        AnchorPoint = Vec2(0.5, 0.5),
                        ThemeTag = {
                            ImageColor3 = "Text"
                        }
                    })
                })
            });
            k.UIElements.SliderContainer = e("Frame", {
                Size = Dim2(1, 0, 0, 0),
                AutomaticSize = "Y",
                Position = Dim2(0, 0, 0, 0),
                BackgroundTransparency = 1,
                Parent = k.SliderFrame.UIElements.Container
            }, {
                e("UIListLayout", {
                    Padding = Dim(0, 8),
                    FillDirection = "Horizontal",
                    VerticalAlignment = "Center"
                }),
                k.UIElements.SliderIcon,
                e("TextBox", {
                    Size = Dim2(0, 60, 0, 0),
                    TextXAlignment = "Left",
                    Text = FormatValue(q),
                    ThemeTag = {
                        TextColor3 = "Text"
                    },
                    TextTransparency = 0.4,
                    AutomaticSize = "Y",
                    TextSize = 15,
                    FontFace = Fnew(b.Font, Enum.FontWeight.Medium),
                    BackgroundTransparency = 1,
                    LayoutOrder = -1
                })
            });
            k.Lock = function(v)
                t = false;
                return k.SliderFrame:Lock();
            end;
            k.Unlock = function(v)
                t = true;
                return k.SliderFrame:Unlock();
            end;
            if k.Locked then
                k:Lock();
            end;
            k.Set = function(v, w, x)
                if t then
                    if not k.IsFocusing and not h and (not x or (x.UserInputType == Enum.UserInputType.MouseButton1 or x.UserInputType == Enum.UserInputType.Touch)) then
                        w = mclamp(w, k.Value.Min or 0, k.Value.Max or 100);
                        local y = mclamp((w - (k.Value.Min or 0)) / ((k.Value.Max or 100) - (k.Value.Min or 0)), 0, 1);
                        w = CalculateValue(k.Value.Min + y * (k.Value.Max - k.Value.Min));
                        if w ~= r then
                            f(k.UIElements.SliderIcon.Frame, 0.08, {
                                Size = Dim2(y, 0, 1, 0)
                            }):Play();
                            k.UIElements.SliderContainer.TextBox.Text = FormatValue(w);
                            k.Value.Default = FormatValue(w);
                            r = w;
                            b.SafeCallback(k.Callback, FormatValue(w));
                        end;
                        if x then
                            n = (x.UserInputType == Enum.UserInputType.Touch);
                            k.SliderFrame.Parent.ScrollingEnabled = false;
                            h = true;
                            o = game:GetService("RunService").RenderStepped:Connect(function()
                                local z = n and x.Position.X or game:GetService("UserInputService"):GetMouseLocation().X;
                                local A = mclamp((z - k.UIElements.SliderIcon.AbsolutePosition.X) / k.UIElements.SliderIcon.AbsoluteSize.X, 0, 1);
                                w = CalculateValue(k.Value.Min + A * (k.Value.Max - k.Value.Min));
                                if w ~= r then
                                    f(k.UIElements.SliderIcon.Frame, 0.08, {
                                        Size = Dim2(A, 0, 1, 0)
                                    }):Play();
                                    k.UIElements.SliderContainer.TextBox.Text = FormatValue(w);
                                    k.Value.Default = FormatValue(w);
                                    r = w;
                                    b.SafeCallback(k.Callback, FormatValue(w));
                                end;
                            end);
                            p = game:GetService("UserInputService").InputEnded:Connect(function(z)
                                if (z.UserInputType == Enum.UserInputType.MouseButton1 or z.UserInputType == Enum.UserInputType.Touch) and x == z then
                                    o:Disconnect();
                                    p:Disconnect();
                                    h = false;
                                    k.SliderFrame.Parent.ScrollingEnabled = true;
                                end;
                            end);
                        end;
                    end;
                end;
            end;
            b.AddSignal(k.UIElements.SliderContainer.TextBox.FocusLost, function(v)
                if v then
                    local w = ton(k.UIElements.SliderContainer.TextBox.Text);
                    if w then
                        k:Set(w);
                    else
                        k.UIElements.SliderContainer.TextBox.Text = FormatValue(r);
                    end;
                end;
            end);
            b.AddSignal(k.UIElements.SliderContainer.InputBegan, function(v)
                k:Set(q, v);
            end);
            return k.__type, k;
        end;
        return g;
    end;
    a.n = function()
        local e = a.load("a");
        local f = e.New;
        local g = e.Tween;
        local h = {
            UICorner = 6,
            UIPadding = 8
        };
        local i = a.load("d");
        local j = i.Label;
        h.New = function(k, n)
            local o = {
                __type = "Keybind",
                Title = n.Title or "Keybind",
                Desc = n.Desc or nil,
                Locked = n.Locked or false,
                Value = n.Value or "F",
                Callback = n.Callback or function()
                end,
                CanChange = n.CanChange or true,
                Picking = false,
                UIElements = {}
            };
            local p = true;
            o.KeybindFrame = a.load("j")({
                Title = o.Title,
                Desc = o.Desc,
                Parent = n.Parent,
                TextOffset = 85,
                Hover = o.CanChange
            });
            o.UIElements.Keybind = j(o.Value, nil, o.KeybindFrame.UIElements.Main);
            o.UIElements.Keybind.Size = Dim2(0, 24 + o.UIElements.Keybind.Frame.Frame.TextLabel.TextBounds.X, 0, 42);
            o.UIElements.Keybind.AnchorPoint = Vec2(1, 0.5);
            o.UIElements.Keybind.Position = Dim2(1, 0, 0.5, 0);
            f("UIScale", {
                Parent = o.UIElements.Keybind,
                Scale = 0.85
            });
            e.AddSignal(o.UIElements.Keybind.Frame.Frame.TextLabel:GetPropertyChangedSignal("TextBounds"), function()
                o.UIElements.Keybind.Size = Dim2(0, 24 + o.UIElements.Keybind.Frame.Frame.TextLabel.TextBounds.X, 0, 42);
            end);
            o.Lock = function(q)
                p = false;
                return o.KeybindFrame:Lock();
            end;
            o.Unlock = function(q)
                p = true;
                return o.KeybindFrame:Unlock();
            end;
            o.Set = function(q, r)
                o.Value = r;
                o.UIElements.Keybind.Frame.Frame.TextLabel.Text = r;
            end;
            if o.Locked then
                o:Lock();
            end;
            e.AddSignal(o.KeybindFrame.UIElements.Main.MouseButton1Click, function()
                if p then
                    if o.CanChange then
                        o.Picking = true;
                        o.UIElements.Keybind.Frame.Frame.TextLabel.Text = "...";
                        twait(0.2);
                        local q;
                        q = b.InputBegan:Connect(function(r)
                            local s;
                            if r.UserInputType == Enum.UserInputType.Keyboard then
                                s = r.KeyCode.Name;
                            else
                                if r.UserInputType == Enum.UserInputType.MouseButton1 then
                                    s = "MouseLeft";
                                else
                                    if r.UserInputType == Enum.UserInputType.MouseButton2 then
                                        s = "MouseRight";
                                    end;
                                end;
                            end;
                            local t;
                            t = b.InputEnded:Connect(function(u)
                                if u.KeyCode.Name == s or s == "MouseLeft" and u.UserInputType == Enum.UserInputType.MouseButton1 or s == "MouseRight" and u.UserInputType == Enum.UserInputType.MouseButton2 then
                                    o.Picking = false;
                                    o.UIElements.Keybind.Frame.Frame.TextLabel.Text = s;
                                    o.Value = s;
                                    q:Disconnect();
                                    t:Disconnect();
                                end;
                            end);
                        end);
                    end;
                end;
            end);
            e.AddSignal(b.InputBegan, function(q)
                if p then
                    if q.KeyCode.Name == o.Value then
                        e.SafeCallback(o.Callback, q.KeyCode.Name);
                    end;
                end;
            end);
            return o.__type, o;
        end;
        return h;
    end;
    a.o = function()
        local b = a.load("a");
        local e = b.New;
        local f = b.Tween;
        local g = {
            UICorner = 8,
            UIPadding = 8
        };
        local h = a.load("d");
        local i = h.Button;
        local j = h.Input;
        g.New = function(k, n)
            local o = {
                __type = "Input",
                Title = n.Title or "Input",
                Desc = n.Desc or nil,
                Type = n.Type or "Input",
                Locked = n.Locked or false,
                InputIcon = n.InputIcon or false,
                PlaceholderText = n.Placeholder or "Enter Text...",
                Value = n.Value or "",
                Callback = n.Callback or function()
                end,
                ClearTextOnFocus = n.ClearTextOnFocus or false,
                UIElements = {}
            };
            local p = true;
            o.InputFrame = a.load("j")({
                Title = o.Title,
                Desc = o.Desc,
                Parent = n.Parent,
                TextOffset = 0,
                Hover = false
            });
            local q = j(o.PlaceholderText, o.InputIcon, o.InputFrame.UIElements.Container, o.Type, function(q)
                o:Set(q);
            end);
            q.Size = Dim2(1, 0, 0, o.Type == "Input" and 42 or 148);
            e("UIScale", {
                Parent = q,
                Scale = 1
            });
            o.Lock = function(r)
                p = false;
                return o.InputFrame:Lock();
            end;
            o.Unlock = function(r)
                p = true;
                return o.InputFrame:Unlock();
            end;
            o.Set = function(r, s)
                if p then
                    b.SafeCallback(o.Callback, s);
                    q.Frame.Frame.TextBox.Text = s;
                    o.Value = s;
                end;
            end;
            o:Set(o.Value);
            if o.Locked then
                o:Lock();
            end;
            return o.__type, o;
        end;
        return g;
    end;
    a.p = function()
        local h = a.load("a");
        local i = h.New;
        local j = h.Tween;
        local k = a.load("d");
        local n = k.Label;
        local o = {
            UICorner = 10,
            UIPadding = 12,
            MenuCorner = 15,
            MenuPadding = 5,
            TabPadding = 6
        };
        o.New = function(p, q)
            local r = {
                __type = "Dropdown",
                Title = q.Title or "Dropdown",
                Desc = q.Desc or nil,
                Locked = q.Locked or false,
                Values = q.Values or {},
                Value = q.Value,
                AllowNone = q.AllowNone,
                Multi = q.Multi,
                Callback = q.Callback or function()
                end,
                UIElements = {},
                Opened = false,
                Tabs = {}
            };
            local s = true;
            r.DropdownFrame = a.load("j")({
                Title = r.Title,
                Desc = r.Desc,
                Parent = q.Parent,
                TextOffset = 0,
                Hover = false
            });
            r.UIElements.Dropdown = n("", nil, r.DropdownFrame.UIElements.Container);
            r.UIElements.Dropdown.Frame.Frame.TextLabel.TextTruncate = "AtEnd";
            r.UIElements.Dropdown.Frame.Frame.TextLabel.Size = Dim2(1, r.UIElements.Dropdown.Frame.Frame.TextLabel.Size.X.Offset - 18 - 12 - 12, 0, 0);
            r.UIElements.Dropdown.Size = Dim2(1, 0, 0, 40);
            i("ImageLabel", {
                Image = h.Icon("chevrons-up-down")[1],
                ImageRectOffset = h.Icon("chevrons-up-down")[2].ImageRectPosition,
                ImageRectSize = h.Icon("chevrons-up-down")[2].ImageRectSize,
                Size = Dim2(0, 18, 0, 18),
                Position = Dim2(1, -12, 0.5, 0),
                ThemeTag = {
                    ImageColor3 = "Icon"
                },
                AnchorPoint = Vec2(1, 0.5),
                Parent = r.UIElements.Dropdown.Frame
            });
            r.UIElements.UIListLayout = i("UIListLayout", {
                Padding = Dim(0, o.MenuPadding / 1.5),
                FillDirection = "Vertical"
            });
            r.UIElements.Menu = h.NewRoundFrame(o.MenuCorner, "Squircle", {
                ThemeTag = {
                    ImageColor3 = "Background"
                },
                ImageTransparency = 0.05,
                Size = Dim2(1, 0, 1, 0),
                AnchorPoint = Vec2(1, 0),
                Position = Dim2(1, 0, 0, 0)
            }, {
                i("UIPadding", {
                    PaddingTop = Dim(0, o.MenuPadding),
                    PaddingLeft = Dim(0, o.MenuPadding),
                    PaddingRight = Dim(0, o.MenuPadding),
                    PaddingBottom = Dim(0, o.MenuPadding)
                }),
                i("CanvasGroup", {
                    BackgroundTransparency = 1,
                    Size = Dim2(1, 0, 1, 0),
                    ClipsDescendants = true
                }, {
                    i("UICorner", {
                        CornerRadius = Dim(0, o.MenuCorner - o.MenuPadding)
                    }),
                    i("ScrollingFrame", {
                        Size = Dim2(1, 0, 1, 0),
                        ScrollBarThickness = 0,
                        ScrollingDirection = "Y",
                        AutomaticCanvasSize = "Y",
                        CanvasSize = Dim2(0, 0, 0, 0),
                        BackgroundTransparency = 1,
                        ScrollBarImageTransparency = 1
                    }, {
                        r.UIElements.UIListLayout
                    })
                })
            });
            r.UIElements.MenuCanvas = i("CanvasGroup", {
                Size = Dim2(0, 190, 0, 300),
                BackgroundTransparency = 1,
                Position = Dim2(-10, 0, -10, 0),
                Visible = false,
                Active = false,
                GroupTransparency = 1,
                Parent = q.WindUI.DropdownGui,
                AnchorPoint = Vec2(1, 0)
            }, {
                r.UIElements.Menu,
                i("UISizeConstraint", {
                    MinSize = Vec2(190, 0)
                })
            });
            r.Lock = function(t)
                s = false;
                return r.DropdownFrame:Lock();
            end;
            r.Unlock = function(t)
                s = true;
                return r.DropdownFrame:Unlock();
            end;
            if r.Locked then
                r:Lock();
            end;
            local function RecalculateCanvasSize()
                r.UIElements.Menu.CanvasGroup.ScrollingFrame.CanvasSize = Dim2Off(0, r.UIElements.UIListLayout.AbsoluteContentSize.Y);
            end
            local function RecalculateListSize()
                if #r.Values > 10 then
                    r.UIElements.MenuCanvas.Size = Dim2Off(r.UIElements.UIListLayout.AbsoluteContentSize.X, 392);
                else
                    r.UIElements.MenuCanvas.Size = Dim2Off(r.UIElements.UIListLayout.AbsoluteContentSize.X, r.UIElements.UIListLayout.AbsoluteContentSize.Y + o.MenuPadding);
                end;
            end
            UpdatePosition = function()
                local t = r.UIElements.Dropdown;
                local u = r.UIElements.MenuCanvas;
                local v = Cam.ViewportSize.Y - (t.AbsolutePosition.Y + t.AbsoluteSize.Y) - o.MenuPadding - 54;
                local w = u.AbsoluteSize.Y + o.MenuPadding;
                local x = -54;
                if v < w then
                    x = w - v - 54;
                end;
                u.Position = Dim2(0, t.AbsolutePosition.X + t.AbsoluteSize.X, 0, t.AbsolutePosition.Y + t.AbsoluteSize.Y - x + o.MenuPadding);
            end;
            r.Display = function(t)
                local u = r.Values;
                local v = "";
                if r.Multi then
                    for w, x in next, u do
                        if tablef(r.Value, x) then
                            v = v .. x .. ", ";
                        end;
                    end;
                    v = v:sub(1, #v - 2);
                else
                    v = r.Value or "";
                end;
                r.UIElements.Dropdown.Frame.Frame.TextLabel.Text = (v == "" and "--" or v);
            end;
            r.Refresh = function(t, u)
                for v, w in next, GetChildren(r.UIElements.Menu.CanvasGroup.ScrollingFrame) do
                    if not IsA(w, "UIListLayout") then
                        Destroy(w);
                    end;
                end;
                r.Tabs = {};
                for x, y in next, u do
                    local z = {
                        Name = y,
                        Selected = false,
                        UIElements = {}
                    };
                    z.UIElements.TabItem = i("TextButton", {
                        Size = Dim2(1, 0, 0, 34),
                        BackgroundTransparency = 1,
                        Parent = r.UIElements.Menu.CanvasGroup.ScrollingFrame,
                        Text = ""
                    }, {
                        i("UIPadding", {
                            PaddingTop = Dim(0, o.TabPadding),
                            PaddingLeft = Dim(0, o.TabPadding + 2),
                            PaddingRight = Dim(0, o.TabPadding + 2),
                            PaddingBottom = Dim(0, o.TabPadding)
                        }),
                        i("UICorner", {
                            CornerRadius = Dim(0, o.MenuCorner - o.MenuPadding)
                        }),
                        i("ImageLabel", {
                            Image = h.Icon("check")[1],
                            ImageRectSize = h.Icon("check")[2].ImageRectSize,
                            ImageRectOffset = h.Icon("check")[2].ImageRectPosition,
                            ThemeTag = {
                                ImageColor3 = "Text"
                            },
                            ImageTransparency = 1,
                            Size = Dim2(0, 18, 0, 18),
                            AnchorPoint = Vec2(0, 0.5),
                            Position = Dim2(0, 0, 0.5, 0),
                            BackgroundTransparency = 1
                        }),
                        i("TextLabel", {
                            Text = y,
                            TextXAlignment = "Left",
                            FontFace = Fnew(h.Font, Enum.FontWeight.Medium),
                            ThemeTag = {
                                TextColor3 = "Text",
                                BackgroundColor3 = "Text"
                            },
                            TextSize = 15,
                            BackgroundTransparency = 1,
                            TextTransparency = 0.4,
                            AutomaticSize = "Y",
                            TextTruncate = "AtEnd",
                            Size = Dim2(1, -18 - o.TabPadding * 3, 0, 0),
                            AnchorPoint = Vec2(0, 0.5),
                            Position = Dim2(0, 0, 0.5, 0)
                        })
                    });
                    if r.Multi then
                        z.Selected = tablef(r.Value or {}, z.Name);
                    else
                        z.Selected = r.Value == z.Name;
                    end;
                    if z.Selected then
                        z.UIElements.TabItem.BackgroundTransparency = 0.93;
                        z.UIElements.TabItem.ImageLabel.ImageTransparency = 0.1;
                        z.UIElements.TabItem.TextLabel.Position = Dim2(0, 18 + o.TabPadding + 2, 0.5, 0);
                        z.UIElements.TabItem.TextLabel.TextTransparency = 0;
                    end;
                    r.Tabs[x] = z;
                    r:Display();
                    local function Callback()
                        r:Display();
                        tspawn(function()
                            h.SafeCallback(r.Callback, r.Value);
                        end);
                    end
                    h.AddSignal(z.UIElements.TabItem.MouseButton1Click, function()
                        if r.Multi then
                            if not z.Selected then
                                z.Selected = true;
                                j(z.UIElements.TabItem, 0.1, {
                                    BackgroundTransparency = 0.93
                                }):Play();
                                j(z.UIElements.TabItem.ImageLabel, 0.1, {
                                    ImageTransparency = 0.1
                                }):Play();
                                j(z.UIElements.TabItem.TextLabel, 0.1, {
                                    Position = Dim2(0, 18 + o.TabPadding, 0.5, 0),
                                    TextTransparency = 0
                                }):Play();
                                tablein(r.Value, z.Name);
                            else
                                if not r.AllowNone and #r.Value == 1 then
                                    return;
                                end;
                                z.Selected = false;
                                j(z.UIElements.TabItem, 0.1, {
                                    BackgroundTransparency = 1
                                }):Play();
                                j(z.UIElements.TabItem.ImageLabel, 0.1, {
                                    ImageTransparency = 1
                                }):Play();
                                j(z.UIElements.TabItem.TextLabel, 0.1, {
                                    Position = Dim2(0, 0, 0.5, 0),
                                    TextTransparency = 0.4
                                }):Play();
                                for A, B in ipir(r.Value) do
                                    if B == z.Name then
                                        tabler(r.Value, A);
                                        break;
                                    end;
                                end;
                            end;
                        else
                            for A, B in next, r.Tabs do
                                j(B.UIElements.TabItem, 0.1, {
                                    BackgroundTransparency = 1
                                }):Play();
                                j(B.UIElements.TabItem.ImageLabel, 0.1, {
                                    ImageTransparency = 1
                                }):Play();
                                j(B.UIElements.TabItem.TextLabel, 0.1, {
                                    Position = Dim2(0, 0, 0.5, 0),
                                    TextTransparency = 0.4
                                }):Play();
                                B.Selected = false;
                            end;
                            z.Selected = true;
                            j(z.UIElements.TabItem, 0.1, {
                                BackgroundTransparency = 0.93
                            }):Play();
                            j(z.UIElements.TabItem.ImageLabel, 0.1, {
                                ImageTransparency = 0.1
                            }):Play();
                            j(z.UIElements.TabItem.TextLabel, 0.1, {
                                Position = Dim2(0, 18 + o.TabPadding, 0.5, 0),
                                TextTransparency = 0
                            }):Play();
                            r.Value = z.Name;
                        end;
                        Callback();
                    end);
                    RecalculateCanvasSize();
                    RecalculateListSize();
                end;
            end;
            r:Refresh(r.Values);
            r.Select = function(t, u)
                if u then
                    r.Value = u;
                end;
                r:Refresh(r.Values);
            end;
            RecalculateListSize();
            r.Open = function(t)
                r.UIElements.MenuCanvas.Visible = true;
                r.UIElements.MenuCanvas.Active = true;
                r.UIElements.Menu.Size = Dim2(1, 0, 0, 0);
                j(r.UIElements.Menu, 0.1, {
                    Size = Dim2(1, 0, 1, 0)
                }, Enum.EasingStyle.Quart, Enum.EasingDirection.Out):Play();
                tspawn(function()
                    twait(0.1);
                    r.Opened = true;
                end);
                j(r.UIElements.MenuCanvas, 0.15, {
                    GroupTransparency = 0
                }):Play();
                UpdatePosition();
            end;
            r.Close = function(t)
                r.Opened = false;
                j(r.UIElements.Menu, 0.1, {
                    Size = Dim2(1, 0, 0.8, 0)
                }, Enum.EasingStyle.Quart, Enum.EasingDirection.Out):Play();
                j(r.UIElements.MenuCanvas, 0.15, {
                    GroupTransparency = 1
                }):Play();
                twait(0.1);
                r.UIElements.MenuCanvas.Visible = false;
                r.UIElements.MenuCanvas.Active = false;
            end;
            h.AddSignal(r.UIElements.Dropdown.MouseButton1Click, function()
                if s then
                    r:Open();
                end;
            end);
            h.AddSignal(UserInputService.InputBegan, function(t)
                if t.UserInputType == Enum.UserInputType.MouseButton1 or t.UserInputType == Enum.UserInputType.Touch then
                    local u, v = r.UIElements.MenuCanvas.AbsolutePosition, r.UIElements.MenuCanvas.AbsoluteSize;
                    if q.Window.CanDropdown and r.Opened and (cmdm.X < u.X or cmdm.X > u.X + v.X or cmdm.Y < (u.Y - 20 - 1) or cmdm.Y > u.Y + v.Y) then
                        r:Close();
                    end;
                end;
            end);
            h.AddSignal(r.UIElements.Dropdown:GetPropertyChangedSignal("AbsolutePosition"), UpdatePosition);
            return r.__type, r;
        end;
        return o;
    end;
    a.q = function()
        local b = a.load("a");
        local e = b.New;
        local g = a.load("d");
        local h = {};
        h.New = function(i, j)
            local k = {
                __type = "Code",
                Title = j.Title,
                Code = j.Code,
                UIElements = {}
            };
            local n = not k.Locked;
            local o = g.Code(k.Code, k.Title, j.Parent, function()
                if n then
                    local o = k.Title or "code";
                    local p, q = pcal(function()
                        setc(k.Code);
                    end);
                    if p then
                        j.WindUI:Notify({
                            Title = "Success",
                            Content = "The " .. o .. " copied to your clipboard.",
                            Icon = "check",
                            Duration = 5
                        });
                    else
                        j.WindUI:Notify({
                            Title = "Error",
                            Content = "The " .. o .. " is not copied. Error: " .. q,
                            Icon = "x",
                            Duration = 5
                        });
                    end;
                end;
            end);
            k.SetCode = function(p, q)
                o.Set(q);
            end;
            return k.__type, k;
        end;
        return h;
    end;
    a.r = function()
        local b = a.load("a");
        local e = b.New;
        local g = b.Tween;
        GetService(game, "TouchInputService");
        local k = H.RenderStepped;
        local p = a.load("d");
        local q = p.Button;
        local r = p.Input;
        local s = {
            UICorner = 8,
            UIPadding = 8
        };
        s.Colorpicker = function(t, u, v)
            local w = {
                __type = "Colorpicker",
                Title = u.Title,
                Desc = u.Desc,
                Default = u.Default,
                Callback = u.Callback,
                Transparency = u.Transparency,
                UIElements = u.UIElements
            };
            w.SetHSVFromRGB = function(x, y)
                local z, A, B = toHSV(y);
                w.Hue = z;
                w.Sat = A;
                w.Vib = B;
            end;
            w:SetHSVFromRGB(w.Default);
            local x = a.load("e").Init(u.Window);
            local y = x.Create();
            w.ColorpickerFrame = y;
            local z, A, B = w.Hue, w.Sat, w.Vib;
            w.UIElements.Title = e("TextLabel", {
                Text = w.Title,
                TextSize = 20,
                FontFace = Fnew(b.Font, Enum.FontWeight.SemiBold),
                TextXAlignment = "Left",
                Size = Dim2(1, 0, 0, 0),
                AutomaticSize = "Y",
                ThemeTag = {
                    TextColor3 = "Text"
                },
                BackgroundTransparency = 1,
                Parent = y.UIElements.Main
            });
            local C = e("ImageLabel", {
                Size = Dim2(0, 18, 0, 18),
                ScaleType = Enum.ScaleType.Fit,
                AnchorPoint = Vec2(0.5, 0.5),
                BackgroundTransparency = 1,
                Image = "http://www.roblox.com/asset/?id=4805639000"
            });
            w.UIElements.SatVibMap = e("ImageLabel", {
                Size = Dim2Off(160, 158),
                Position = Dim2Off(0, 40),
                Image = "rbxassetid://4155801252",
                BackgroundColor3 = fromHSV(z, 1, 1),
                BackgroundTransparency = 0,
                Parent = y.UIElements.Main
            }, {
                e("UICorner", {
                    CornerRadius = Dim(0, 8)
                }),
                e("UIStroke", {
                    Thickness = 0.6,
                    ThemeTag = {
                        Color = "Text"
                    },
                    Transparency = 0.8
                }),
                C
            });
            w.UIElements.Inputs = e("Frame", {
                AutomaticSize = "XY",
                Size = Dim2(0, 0, 0, 0),
                Position = Dim2Off(w.Transparency and 240 or 210, 40),
                BackgroundTransparency = 1,
                Parent = y.UIElements.Main
            }, {
                e("UIListLayout", {
                    Padding = Dim(0, 5),
                    FillDirection = "Vertical"
                })
            });
            local D = e("Frame", {
                BackgroundColor3 = w.Default,
                Size = Dim2Scale(1, 1),
                BackgroundTransparency = w.Transparency
            }, {
                e("UICorner", {
                    CornerRadius = Dim(0, 8)
                })
            });
            e("ImageLabel", {
                Image = "http://www.roblox.com/asset/?id=14204231522",
                ImageTransparency = 0.45,
                ScaleType = Enum.ScaleType.Tile,
                TileSize = Dim2Off(40, 40),
                BackgroundTransparency = 1,
                Position = Dim2Off(85, 208),
                Size = Dim2Off(75, 24),
                Parent = y.UIElements.Main
            }, {
                e("UICorner", {
                    CornerRadius = Dim(0, 8)
                }),
                e("UIStroke", {
                    Thickness = 1,
                    Transparency = 0.8,
                    ThemeTag = {
                        Color = "Text"
                    }
                }),
                D
            });
            local E = e("Frame", {
                BackgroundColor3 = w.Default,
                Size = Dim2Scale(1, 1),
                BackgroundTransparency = 0,
                ZIndex = 9
            }, {
                e("UICorner", {
                    CornerRadius = Dim(0, 8)
                })
            });
            e("ImageLabel", {
                Image = "http://www.roblox.com/asset/?id=14204231522",
                ImageTransparency = 0.45,
                ScaleType = Enum.ScaleType.Tile,
                TileSize = Dim2Off(40, 40),
                BackgroundTransparency = 1,
                Position = Dim2Off(0, 208),
                Size = Dim2Off(75, 24),
                Parent = y.UIElements.Main
            }, {
                e("UICorner", {
                    CornerRadius = Dim(0, 8)
                }),
                e("UIStroke", {
                    Thickness = 1,
                    Transparency = 0.8,
                    ThemeTag = {
                        Color = "Text"
                    }
                }),
                E
            });
            local F = {};
            for G = 0, 1, 0.1 do
                tablein(F, CSKnew(G, fromHSV(G, 1, 1)));
            end;
            local G = e("UIGradient", {
                Color = CSnew(F),
                Rotation = 90
            });
            local H = e("Frame", {
                Size = Dim2(1, 0, 1, 0),
                Position = Dim2(0, 0, 0, 0),
                BackgroundTransparency = 1
            });
            local I = e("Frame", {
                Size = Dim2(0, 14, 0, 14),
                AnchorPoint = Vec2(0.5, 0.5),
                Position = Dim2(0.5, 0, 0, 0),
                Parent = H,
                BackgroundColor3 = w.Default
            }, {
                e("UIStroke", {
                    Thickness = 2,
                    Transparency = 0.1,
                    ThemeTag = {
                        Color = "Text"
                    }
                }),
                e("UICorner", {
                    CornerRadius = Dim(1, 0)
                })
            });
            local J = e("Frame", {
                Size = Dim2Off(10, 192),
                Position = Dim2Off(180, 40),
                Parent = y.UIElements.Main
            }, {
                e("UICorner", {
                    CornerRadius = Dim(1, 0)
                }),
                G,
                H
            });
            CreateNewInput = function(K, L)
                local M = r(K, nil, w.UIElements.Inputs);
                e("TextLabel", {
                    BackgroundTransparency = 1,
                    TextTransparency = 0.4,
                    TextSize = 17,
                    FontFace = Fnew(b.Font, Enum.FontWeight.Regular),
                    AutomaticSize = "XY",
                    ThemeTag = {
                        TextColor3 = "Placeholder"
                    },
                    AnchorPoint = Vec2(1, 0.5),
                    Position = Dim2(1, -12, 0.5, 0),
                    Parent = M.Frame,
                    Text = K
                });
                e("UIScale", {
                    Parent = M,
                    Scale = 0.85
                });
                M.Frame.Frame.TextBox.Text = L;
                M.Size = Dim2(0, 150, 0, 42);
                return M;
            end;
            local function ToRGB(K)
                return {
                    R = mfloor(K.R * 255),
                    G = mfloor(K.G * 255),
                    B = mfloor(K.B * 255)
                };
            end
            local K = CreateNewInput("Hex", "#" .. w.Default:ToHex());
            local L = CreateNewInput("Red", ToRGB(w.Default).R);
            local M = CreateNewInput("Green", ToRGB(w.Default).G);
            local N = CreateNewInput("Blue", ToRGB(w.Default).B);
            local O;
            if w.Transparency then
                O = CreateNewInput("Alpha", ((1 - w.Transparency) * 100) .. "%");
            end;
            local P = e("Frame", {
                Size = Dim2(1, 0, 0, 40),
                AutomaticSize = "Y",
                Position = Dim2(0, 0, 0, 254),
                BackgroundTransparency = 1,
                Parent = y.UIElements.Main,
                LayoutOrder = 4
            }, {
                e("UIListLayout", {
                    Padding = Dim(0, 8),
                    FillDirection = "Horizontal",
                    HorizontalAlignment = "Right"
                })
            });
            local Q = {
                {
                    Title = "Cancel",
                    Variant = "Secondary",
                    Callback = function()
                    end
                },
                {
                    Title = "Apply",
                    Icon = "chevron-right",
                    Variant = "Primary",
                    Callback = function()
                        v(fromHSV(w.Hue, w.Sat, w.Vib), w.Transparency);
                    end
                }
            };
            for R, S in next, Q do
                q(S.Title, S.Icon, S.Callback, S.Variant, P, y);
            end;
            local T, U, V;
            if w.Transparency then
                local W = e("Frame", {
                    Size = Dim2(1, 0, 1, 0),
                    Position = Dim2Off(0, 0),
                    BackgroundTransparency = 1
                });
                U = e("ImageLabel", {
                    Size = Dim2(0, 14, 0, 14),
                    AnchorPoint = Vec2(0.5, 0.5),
                    Position = Dim2(0.5, 0, 0, 0),
                    ThemeTag = {
                        BackgroundColor3 = "Text"
                    },
                    Parent = W
                }, {
                    e("UIStroke", {
                        Thickness = 2,
                        Transparency = 0.1,
                        ThemeTag = {
                            Color = "Text"
                        }
                    }),
                    e("UICorner", {
                        CornerRadius = Dim(1, 0)
                    })
                });
                V = e("Frame", {
                    Size = Dim2Scale(1, 1)
                }, {
                    e("UIGradient", {
                        Transparency = NSnew({
                            NSKnew(0, 0),
                            NSKnew(1, 1)
                        }),
                        Rotation = 270
                    }),
                    e("UICorner", {
                        CornerRadius = Dim(0, 6)
                    })
                });
                T = e("Frame", {
                    Size = Dim2Off(10, 192),
                    Position = Dim2Off(210, 40),
                    Parent = y.UIElements.Main,
                    BackgroundTransparency = 1
                }, {
                    e("UICorner", {
                        CornerRadius = Dim(1, 0)
                    }),
                    e("ImageLabel", {
                        Image = "rbxassetid://14204231522",
                        ImageTransparency = 0.45,
                        ScaleType = Enum.ScaleType.Tile,
                        TileSize = Dim2Off(40, 40),
                        BackgroundTransparency = 1,
                        Size = Dim2Scale(1, 1)
                    }, {
                        e("UICorner", {
                            CornerRadius = Dim(1, 0)
                        })
                    }),
                    V,
                    W
                });
            end;
            w.Round = function(W, X, Y)
                if Y == 0 then
                    return mfloor(X);
                end;
                X = tos(X);
                return X:find("%.") and ton(X:sub(1, X:find("%.") + Y)) or X;
            end;
            w.Update = function(W, X, Y)
                if X then
                    z, A, B = toHSV(X);
                else
                    z, A, B = w.Hue, w.Sat, w.Vib;
                end;
                w.UIElements.SatVibMap.BackgroundColor3 = fromHSV(z, 1, 1);
                C.Position = Dim2(A, 0, 1 - B, 0);
                E.BackgroundColor3 = fromHSV(z, A, B);
                I.BackgroundColor3 = fromHSV(z, 1, 1);
                I.Position = Dim2(0.5, 0, z, 0);
                K.Frame.Frame.TextBox.Text = "#" .. fromHSV(z, A, B):ToHex();
                L.Frame.Frame.TextBox.Text = ToRGB(fromHSV(z, A, B)).R;
                M.Frame.Frame.TextBox.Text = ToRGB(fromHSV(z, A, B)).G;
                N.Frame.Frame.TextBox.Text = ToRGB(fromHSV(z, A, B)).B;
                if Y or w.Transparency then
                    E.BackgroundTransparency = w.Transparency or Y;
                    V.BackgroundColor3 = fromHSV(z, A, B);
                    U.BackgroundColor3 = fromHSV(z, A, B);
                    U.BackgroundTransparency = w.Transparency or Y;
                    U.Position = Dim2(0.5, 0, 1 - w.Transparency or Y, 0);
                    O.Frame.Frame.TextBox.Text = w:Round((1 - w.Transparency or Y) * 100, 0) .. "%";
                end;
            end;
            w:Update(w.Default, w.Transparency);
            local function GetRGB()
                local W = fromHSV(w.Hue, w.Sat, w.Vib);
                return {
                    R = mfloor(W.r * 255),
                    G = mfloor(W.g * 255),
                    B = mfloor(W.b * 255)
                };
            end
            local function clamp(W, X, Y)
                return mclamp(ton(W) or 0, X, Y);
            end
            b.AddSignal(K.Frame.Frame.TextBox.FocusLost, function(W)
                if W then
                    local X = K.Frame.Frame.TextBox.Text:gsub("#", "");
                    local Y, Z = pcal(fromHex, X);
                    if Y and typeof(Z) == "Color3" then
                        w.Hue, w.Sat, w.Vib = toHSV(Z);
                        w:Update();
                        w.Default = Z;
                    end;
                end;
            end);
            local function updateColorFromInput(W, X)
                b.AddSignal(W.Frame.Frame.TextBox.FocusLost, function(Y)
                    if Y then
                        local Z = W.Frame.Frame.TextBox;
                        local _ = GetRGB();
                        local aa = clamp(Z.Text, 0, 255);
                        Z.Text = tos(aa);
                        _[X] = aa;
                        local ab = fromRGB(_.R, _.G, _.B);
                        w.Hue, w.Sat, w.Vib = toHSV(ab);
                        w:Update();
                    end;
                end);
            end
            updateColorFromInput(L, "R");
            updateColorFromInput(M, "G");
            updateColorFromInput(N, "B");
            if w.Transparency then
                b.AddSignal(O.Frame.Frame.TextBox.FocusLost, function(aa)
                    if aa then
                        local ab = O.Frame.Frame.TextBox;
                        local W = clamp(ab.Text, 0, 100);
                        ab.Text = tos(W);
                        w.Transparency = 1 - W * 0.01;
                        w:Update(nil, w.Transparency);
                    end;
                end);
            end;
            local aa = w.UIElements.SatVibMap;
            b.AddSignal(aa.InputBegan, function(ab)
                if ab.UserInputType == Enum.UserInputType.MouseButton1 or ab.UserInputType == Enum.UserInputType.Touch then
                    while UserInputService:IsMouseButtonPressed(Enum.UserInputType.MouseButton1) do
                        local W = aa.AbsolutePosition.X;
                        local X = W + aa.AbsoluteSize.X;
                        local Y = mclamp(cmdm.X, W, X);
                        local Z = aa.AbsolutePosition.Y;
                        local _ = Z + aa.AbsoluteSize.Y;
                        local ac = mclamp(cmdm.Y, Z, _);
                        w.Sat = (Y - W) / (X - W);
                        w.Vib = 1 - ((ac - Z) / (_ - Z));
                        w:Update();
                        k:Wait();
                    end;
                end;
            end);
            b.AddSignal(J.InputBegan, function(ab)
                if ab.UserInputType == Enum.UserInputType.MouseButton1 or ab.UserInputType == Enum.UserInputType.Touch then
                    while UserInputService:IsMouseButtonPressed(Enum.UserInputType.MouseButton1) do
                        local ac = J.AbsolutePosition.Y;
                        local W = ac + J.AbsoluteSize.Y;
                        local X = mclamp(cmdm.Y, ac, W);
                        w.Hue = ((X - ac) / (W - ac));
                        w:Update();
                        k:Wait();
                    end;
                end;
            end);
            if w.Transparency then
                b.AddSignal(T.InputBegan, function(ab)
                    if ab.UserInputType == Enum.UserInputType.MouseButton1 or ab.UserInputType == Enum.UserInputType.Touch then
                        while UserInputService:IsMouseButtonPressed(Enum.UserInputType.MouseButton1) do
                            local ac = T.AbsolutePosition.Y;
                            local W = ac + T.AbsoluteSize.Y;
                            local X = mclamp(cmdm.Y, ac, W);
                            w.Transparency = 1 - ((X - ac) / (W - ac));
                            w:Update();
                            k:Wait();
                        end;
                    end;
                end);
            end;
            return w;
        end;
        s.New = function(aa, ab)
            local ac = {
                __type = "Colorpicker",
                Title = ab.Title or "Colorpicker",
                Desc = ab.Desc or nil,
                Locked = ab.Locked or false,
                Default = ab.Default or Col3new(1, 1, 1),
                Callback = ab.Callback or function()
                end,
                Window = ab.Window,
                Transparency = ab.Transparency,
                UIElements = {}
            };
            local t = true;
            ac.ColorpickerFrame = a.load("j")({
                Title = ac.Title,
                Desc = ac.Desc,
                Parent = ab.Parent,
                TextOffset = 40,
                Hover = false
            });
            ac.UIElements.Colorpicker = b.NewRoundFrame(s.UICorner, "Squircle", {
                ImageTransparency = 0,
                Active = true,
                ImageColor3 = ac.Default,
                Parent = ac.ColorpickerFrame.UIElements.Main,
                Size = Dim2(0, 30, 0, 30),
                AnchorPoint = Vec2(1, 0.5),
                Position = Dim2(1, 0, 0.5, 0),
                ZIndex = 2
            }, nil, true);
            ac.Lock = function(u)
                t = false;
                return ac.ColorpickerFrame:Lock();
            end;
            ac.Unlock = function(u)
                t = true;
                return ac.ColorpickerFrame:Unlock();
            end;
            if ac.Locked then
                ac:Lock();
            end;
            ac.Update = function(u, v, w)
                ac.UIElements.Colorpicker.ImageTransparency = w or 0;
                ac.UIElements.Colorpicker.ImageColor3 = v;
                ac.Default = v;
                if w then
                    ac.Transparency = w;
                end;
            end;
            ac.Set = function(u, v, w)
                return ac:Update(v, w);
            end;
            b.AddSignal(ac.UIElements.Colorpicker.MouseButton1Click, function()
                if t then
                    s:Colorpicker(ac, function(u, v)
                        if t then
                            ac:Update(u, v);
                            ac.Default = u;
                            ac.Transparency = v;
                            b.SafeCallback(ac.Callback, u, v);
                        end;
                    end).ColorpickerFrame:Open();
                end;
            end);
            return ac.__type, ac;
        end;
        return s;
    end;
    a.s = function()
        local aa = a.load("a");
        local ab = aa.New;
        local ac = aa.Tween;
        local b = {};
        b.New = function(e, g)
            local h = {
                __type = "Section",
                Title = g.Title or "Section",
                Icon = g.Icon,
                TextXAlignment = g.TextXAlignment or "Left",
                TextSize = g.TextSize or 19,
                UIElements = {}
            };
            local i;
            if h.Icon then
                i = aa.Image(h.Icon, h.Icon .. ":" .. h.Title, 0, g.Window.Folder, h.__type, true);
                i.Size = Dim2(0, 24, 0, 24);
            end;
            h.UIElements.Main = ab("TextLabel", {
                BackgroundTransparency = 1,
                TextXAlignment = "Left",
                AutomaticSize = "XY",
                TextSize = h.TextSize,
                ThemeTag = {
                    TextColor3 = "Text"
                },
                FontFace = Fnew(aa.Font, Enum.FontWeight.SemiBold),
                Text = h.Title
            });
            ab("Frame", {
                Size = Dim2(1, 0, 0, 0),
                BackgroundTransparency = 1,
                AutomaticSize = "Y",
                Parent = g.Parent
            }, {
                i,
                h.UIElements.Main,
                ab("UIListLayout", {
                    Padding = Dim(0, 8),
                    FillDirection = "Horizontal",
                    VerticalAlignment = "Center",
                    HorizontalAlignment = h.TextXAlignment
                }),
                ab("UIPadding", {
                    PaddingTop = Dim(0, 4),
                    PaddingBottom = Dim(0, 2)
                })
            });
            h.SetTitle = function(j, k)
                h.UIElements.Main.Text = k;
            end;
            h.Destroy = function(j)
                h.UIElements.Main.AutomaticSize = "None";
                h.UIElements.Main.Size = Dim2(1, 0, 0, h.UIElements.Main.TextBounds.Y);
                ac(h.UIElements.Main, 0.1, {
                    TextTransparency = 1
                }):Play();
                twait(0.1);
                ac(h.UIElements.Main, 0.15, {
                    Size = Dim2(1, 0, 0, 0)
                }, Enum.EasingStyle.Quint, Enum.EasingDirection.InOut):Play();
            end;
            return h.__type, h;
        end;
        return b;
    end;
    a.t = function()
        GetService(game, "UserInputService");
        local ab = a.load("a");
        local ac = ab.New;
        local b = ab.Tween;
        local e = a.load("d");
        local g = e.Button;
        local h = e.ScrollSlider;
        local i = {
            Window = nil,
            WindUI = nil,
            Tabs = {},
            Containers = {},
            SelectedTab = nil,
            TabCount = 0,
            ToolTipParent = nil,
            TabHighlight = nil,
            OnChangeFunc = function(i)
            end
        };
        i.Init = function(j, k, n, o)
            i.Window = j;
            i.WindUI = k;
            i.ToolTipParent = n;
            i.TabHighlight = o;
            return i;
        end;
        i.New = function(j)
            local k = {
                __type = "Tab",
                Title = j.Title or "Tab",
                Desc = j.Desc,
                Icon = j.Icon,
                IconThemed = j.IconThemed,
                Locked = j.Locked,
                ShowTabTitle = j.ShowTabTitle,
                Selected = false,
                Index = nil,
                Parent = j.Parent,
                UIElements = {},
                Elements = {},
                ContainerFrame = nil
            };
            local n = i.Window;
            local o = i.WindUI;
            i.TabCount = i.TabCount + 1;
            local p = i.TabCount;
            k.Index = p;
            k.UIElements.Main = ac("TextButton", {
                BackgroundTransparency = 1,
                Size = Dim2(1, -7, 0, 0),
                AutomaticSize = "Y",
                Parent = j.Parent
            }, {
                ac("UIListLayout", {
                    SortOrder = "LayoutOrder",
                    Padding = Dim(0, 10),
                    FillDirection = "Horizontal",
                    VerticalAlignment = "Center"
                }),
                ac("TextLabel", {
                    Text = k.Title,
                    ThemeTag = {
                        TextColor3 = "Text"
                    },
                    TextTransparency = not k.Locked and 0.4 or 0.7,
                    TextSize = 15,
                    Size = Dim2(1, 0, 0, 0),
                    FontFace = Fnew(ab.Font, Enum.FontWeight.Medium),
                    TextWrapped = true,
                    RichText = true,
                    AutomaticSize = "Y",
                    LayoutOrder = 2,
                    TextXAlignment = "Left",
                    BackgroundTransparency = 1
                }),
                ac("UIPadding", {
                    PaddingTop = Dim(0, 6),
                    PaddingBottom = Dim(0, 6)
                })
            });
            local q = 0;
            local r;
            if k.Icon then
                r = ab.Image(k.Icon, k.Icon .. ":" .. k.Title, 0, i.Window.Folder, k.__type, true, k.IconThemed);
                r.Size = Dim2(0, 18, 0, 18);
                r.Parent = k.UIElements.Main;
                r.ImageLabel.ImageTransparency = not k.Locked and 0 or 0.7;
                k.UIElements.Main.TextLabel.Size = Dim2(1, -30, 0, 0);
                q = -30;
                k.UIElements.Icon = r;
            end;
            k.UIElements.ContainerFrame = ac("ScrollingFrame", {
                Size = Dim2(1, 0, 1, k.ShowTabTitle and -((n.UIPadding * 2.4) + 12) or 0),
                BackgroundTransparency = 1,
                ScrollBarThickness = 0,
                ElasticBehavior = "Never",
                CanvasSize = Dim2(0, 0, 0, 0),
                AnchorPoint = Vec2(0, 1),
                Position = Dim2(0, 0, 1, 0),
                AutomaticCanvasSize = "Y",
                ScrollingDirection = "Y"
            }, {
                ac("UIPadding", {
                    PaddingTop = Dim(0, n.UIPadding * 1.2),
                    PaddingLeft = Dim(0, n.UIPadding * 1.2),
                    PaddingRight = Dim(0, n.UIPadding * 1.2),
                    PaddingBottom = Dim(0, n.UIPadding * 1.2)
                }),
                ac("UIListLayout", {
                    SortOrder = "LayoutOrder",
                    Padding = Dim(0, 6),
                    HorizontalAlignment = "Center"
                })
            });
            k.UIElements.ContainerFrameCanvas = ac("Frame", {
                Size = Dim2(1, 0, 1, 0),
                BackgroundTransparency = 1,
                Visible = false,
                Parent = n.UIElements.MainBar,
                ZIndex = 5
            }, {
                k.UIElements.ContainerFrame,
                ac("Frame", {
                    Size = Dim2(1, 0, 0, ((n.UIPadding * 2.4) + 12)),
                    BackgroundTransparency = 1,
                    Visible = k.ShowTabTitle or false,
                    Name = "TabTitle"
                }, {
                    r and r:Clone(),
                    ac("TextLabel", {
                        Text = k.Title,
                        ThemeTag = {
                            TextColor3 = "Text"
                        },
                        TextSize = 20,
                        TextTransparency = 0.1,
                        Size = Dim2(1, 0, 1, 0),
                        FontFace = Fnew(ab.Font, Enum.FontWeight.SemiBold),
                        TextTruncate = "AtEnd",
                        RichText = true,
                        LayoutOrder = 2,
                        TextXAlignment = "Left",
                        BackgroundTransparency = 1
                    }),
                    ac("UIPadding", {
                        PaddingTop = Dim(0, n.UIPadding * 1.2),
                        PaddingLeft = Dim(0, n.UIPadding * 1.2),
                        PaddingRight = Dim(0, n.UIPadding * 1.2),
                        PaddingBottom = Dim(0, n.UIPadding * 1.2)
                    }),
                    ac("UIListLayout", {
                        SortOrder = "LayoutOrder",
                        Padding = Dim(0, 10),
                        FillDirection = "Horizontal",
                        VerticalAlignment = "Center"
                    })
                }),
                ac("Frame", {
                    Size = Dim2(1, 0, 0, 1),
                    BackgroundTransparency = 0.9,
                    ThemeTag = {
                        BackgroundColor3 = "Text"
                    },
                    Position = Dim2(0, 0, 0, ((n.UIPadding * 2.4) + 12)),
                    Visible = k.ShowTabTitle or false
                })
            });
            i.Containers[p] = k.UIElements.ContainerFrameCanvas;
            i.Tabs[p] = k;
            k.ContainerFrame = ContainerFrameCanvas;
            ab.AddSignal(k.UIElements.Main.MouseButton1Click, function()
                if not k.Locked then
                    i:SelectTab(p);
                end;
            end);
            h(k.UIElements.ContainerFrame, k.UIElements.ContainerFrameCanvas, n, 3);
            if k.Desc then
                local s;
                local t;
                local u;
                local v = false;
                local function removeToolTip()
                    v = false;
                    if t then
                        tcancel(t);
                        t = nil;
                    end;
                    if u then
                        u:Disconnect();
                        u = nil;
                    end;
                    if s then
                        s:Close();
                        s = nil;
                    end;
                end
                ab.AddSignal(k.UIElements.Main.InputBegan, function()
                    v = true;
                    t = tspawn(function()
                        twait(0.35);
                        if v and not s then
                            s = e.ToolTip(k.Desc, i.ToolTipParent);
                            local function updatePosition()
                                if s then
                                    s.Container.Position = Dim2(0, cmdm.X, 0, cmdm.Y - 20);
                                end;
                            end
                            updatePosition();
                            u = cmdm.Move:Connect(updatePosition);
                            s:Open();
                        end;
                    end);
                end);
                ab.AddSignal(k.UIElements.Main.InputEnded, removeToolTip);
            end;
            local s = {
                Button = a.load("k"),
                Toggle = a.load("l"),
                Slider = a.load("m"),
                Keybind = a.load("n"),
                Input = a.load("o"),
                Dropdown = a.load("p"),
                Code = a.load("q"),
                Colorpicker = a.load("r"),
                Section = a.load("s")
            };
            k.Divider = function(t)
                local u = ac("Frame", {
                    Size = Dim2(1, 0, 0, 1),
                    Position = Dim2(0.5, 0, 0.5, 0),
                    AnchorPoint = Vec2(0.5, 0.5),
                    BackgroundTransparency = 0.9,
                    ThemeTag = {
                        BackgroundColor3 = "Text"
                    }
                });
                local v = ac("Frame", {
                    Parent = k.UIElements.ContainerFrame,
                    Size = Dim2(1, -7, 0, 5),
                    BackgroundTransparency = 1
                }, {
                    u
                });
                return v;
            end;
            k.Paragraph = function(t, u)
                u.Parent = k.UIElements.ContainerFrame;
                u.Window = n;
                u.Hover = false;
                u.TextOffset = 0;
                u.IsButtons = u.Buttons and #u.Buttons > 0 and true or false;
                local v = {
                    __type = "Paragraph",
                    Title = u.Title or "Paragraph",
                    Desc = u.Desc or nil,
                    Locked = u.Locked or false
                };
                local w = a.load("j")(u);
                v.ParagraphFrame = w;
                if u.Buttons and #u.Buttons > 0 then
                    local x = ac("Frame", {
                        Size = Dim2(0, 0, 0, 38),
                        BackgroundTransparency = 1,
                        AutomaticSize = "Y",
                        Parent = w.UIElements.Container
                    }, {
                        ac("UIListLayout", {
                            Padding = Dim(0, 10),
                            FillDirection = "Vertical"
                        })
                    });
                    for y, z in next, u.Buttons do
                        local A = g(z.Title, z.Icon, z.Callback, "White", x);
                        A.Size = Dim2(0, 0, 0, 38);
                        A.AutomaticSize = "X";
                    end;
                end;
                v.SetTitle = function(x, y)
                    v.ParagraphFrame:SetTitle(y);
                end;
                v.SetDesc = function(x, y)
                    v.ParagraphFrame:SetDesc(y);
                end;
                v.Destroy = function(x)
                    v.ParagraphFrame:Destroy();
                end;
                tablein(k.Elements, v);
                return v;
            end;
            for t, u in pir(s) do
                k[t] = function(v, w)
                    w.Parent = v.UIElements.ContainerFrame;
                    w.Window = n;
                    w.WindUI = o;
                    local x, y = u:New(w);
                    tablein(v.Elements, y);
                    local z;
                    for A, B in pir(y) do
                        if typeof(B) == "table" and A:match("Frame$") then
                            z = B;
                            break;
                        end;
                    end;
                    if z then
                        y.SetTitle = function(C, D)
                            z:SetTitle(D);
                        end;
                        y.SetDesc = function(C, D)
                            z:SetDesc(D);
                        end;
                        y.Destroy = function(C)
                            Destroy(z);
                        end;
                    end;
                    return y;
                end;
            end;
            tspawn(function()
                local v = ac("Frame", {
                    BackgroundTransparency = 1,
                    Size = Dim2(1, 0, 1, -n.UIElements.Main.Main.Topbar.AbsoluteSize.Y),
                    Parent = k.UIElements.ContainerFrame
                }, {
                    ac("UIListLayout", {
                        Padding = Dim(0, 8),
                        SortOrder = "LayoutOrder",
                        VerticalAlignment = "Center",
                        HorizontalAlignment = "Center",
                        FillDirection = "Vertical"
                    }),
                    ac("ImageLabel", {
                        Size = Dim2(0, 48, 0, 48),
                        Image = ab.Icon("frown")[1],
                        ImageRectOffset = ab.Icon("frown")[2].ImageRectPosition,
                        ImageRectSize = ab.Icon("frown")[2].ImageRectSize,
                        ThemeTag = {
                            ImageColor3 = "Icon"
                        },
                        BackgroundTransparency = 1,
                        ImageTransparency = 0.6
                    }),
                    ac("TextLabel", {
                        AutomaticSize = "XY",
                        Text = "This tab is empty",
                        ThemeTag = {
                            TextColor3 = "Text"
                        },
                        TextSize = 18,
                        TextTransparency = 0.5,
                        BackgroundTransparency = 1,
                        FontFace = Fnew(ab.Font, Enum.FontWeight.Medium)
                    })
                });
                ab.AddSignal(k.UIElements.ContainerFrame.ChildAdded, function()
                    v.Visible = false;
                end);
            end);
            return k;
        end;
        i.OnChange = function(j, k)
            i.OnChangeFunc = k;
        end;
        i.SelectTab = function(j, k)
            if not i.Tabs[k].Locked then
                i.SelectedTab = k;
                for n, o in next, i.Tabs do
                    if not o.Locked then
                        b(o.UIElements.Main.TextLabel, 0.15, {
                            TextTransparency = 0.45
                        }):Play();
                        if o.UIElements.Icon then
                            b(o.UIElements.Icon.ImageLabel, 0.15, {
                                ImageTransparency = 0.5
                            }):Play();
                        end;
                        o.Selected = false;
                    end;
                end;
                b(i.Tabs[k].UIElements.Main.TextLabel, 0.15, {
                    TextTransparency = 0
                }):Play();
                if i.Tabs[k].UIElements.Icon then
                    b(i.Tabs[k].UIElements.Icon.ImageLabel, 0.15, {
                        ImageTransparency = 0.15
                    }):Play();
                end;
                i.Tabs[k].Selected = true;
                b(i.TabHighlight, 0.25, {
                    Position = Dim2(0, 0, 0, i.Tabs[k].UIElements.Main.AbsolutePosition.Y - i.Tabs[k].Parent.AbsolutePosition.Y),
                    Size = Dim2(1, -7, 0, i.Tabs[k].UIElements.Main.AbsoluteSize.Y)
                }, Enum.EasingStyle.Quint, Enum.EasingDirection.Out):Play();
                tspawn(function()
                    for p, q in next, i.Containers do
                        q.AnchorPoint = Vec2(0, 0.05);
                        q.Visible = false;
                    end;
                    i.Containers[k].Visible = true;
                    b(i.Containers[k], 0.15, {
                        AnchorPoint = Vec2(0, 0)
                    }, Enum.EasingStyle.Quart, Enum.EasingDirection.Out):Play();
                end);
                i.OnChangeFunc(k);
            end;
        end;
        return i;
    end;
    a.u = function()
        GetService(game, "UserInputService");
        local aa = {
            Margin = 8,
            Padding = 9
        };
        local ab = a.load("a");
        local ac = ab.New;
        local b = ab.Tween;
        aa.new = function(e, g, h)
            local i = {
                IconSize = 14,
                Padding = 14,
                Radius = 15,
                Width = 400,
                MaxHeight = 380,
                Icons = {
                    Tab = "table-of-contents",
                    Paragraph = "type",
                    Button = "square-mouse-pointer",
                    Toggle = "toggle-right",
                    Slider = "sliders-horizontal",
                    Keybind = "command",
                    Input = "text-cursor-input",
                    Dropdown = "chevrons-up-down",
                    Code = "terminal",
                    Colorpicker = "palette"
                }
            };
            local j = ac("TextBox", {
                Text = "",
                PlaceholderText = "Search...",
                ThemeTag = {
                    PlaceholderColor3 = "Placeholder",
                    TextColor3 = "Text"
                },
                Size = Dim2(1, -((i.IconSize * 2) + (i.Padding * 2)), 0, 0),
                AutomaticSize = "Y",
                ClipsDescendants = true,
                ClearTextOnFocus = false,
                BackgroundTransparency = 1,
                TextXAlignment = "Left",
                FontFace = Fnew(ab.Font, Enum.FontWeight.Regular),
                TextSize = 17
            });
            local k = ac("ImageLabel", {
                Image = ab.Icon("x")[1],
                ImageRectSize = ab.Icon("x")[2].ImageRectSize,
                ImageRectOffset = ab.Icon("x")[2].ImageRectPosition,
                BackgroundTransparency = 1,
                ThemeTag = {
                    ImageColor3 = "Text"
                },
                ImageTransparency = 0.2,
                Size = Dim2(0, i.IconSize, 0, i.IconSize)
            }, {
                ac("TextButton", {
                    Size = Dim2(1, 8, 1, 8),
                    BackgroundTransparency = 1,
                    Active = true,
                    ZIndex = 999999999,
                    AnchorPoint = Vec2(0.5, 0.5),
                    Position = Dim2(0.5, 0, 0.5, 0),
                    Text = ""
                })
            });
            local n = ac("ScrollingFrame", {
                Size = Dim2(1, 0, 0, 0),
                AutomaticCanvasSize = "Y",
                ScrollingDirection = "Y",
                ElasticBehavior = "Never",
                ScrollBarThickness = 0,
                CanvasSize = Dim2(0, 0, 0, 0),
                BackgroundTransparency = 1,
                Visible = false
            }, {
                ac("UIListLayout", {
                    Padding = Dim(0, 0),
                    FillDirection = "Vertical"
                }),
                ac("UIPadding", {
                    PaddingTop = Dim(0, i.Padding),
                    PaddingLeft = Dim(0, i.Padding),
                    PaddingRight = Dim(0, i.Padding),
                    PaddingBottom = Dim(0, i.Padding)
                })
            });
            local o = ab.NewRoundFrame(i.Radius, "Squircle", {
                Size = Dim2(1, 0, 1, 0),
                ThemeTag = {
                    ImageColor3 = "Accent"
                },
                ImageTransparency = 0
            }, {
                ac("Frame", {
                    Size = Dim2(1, 0, 1, 0),
                    BackgroundTransparency = 1,
                    Visible = false
                }, {
                    ac("Frame", {
                        Size = Dim2(1, 0, 0, 46),
                        BackgroundTransparency = 1
                    }, {
                        ac("Frame", {
                            Size = Dim2(1, 0, 1, 0),
                            BackgroundTransparency = 1
                        }, {
                            ac("ImageLabel", {
                                Image = ab.Icon("search")[1],
                                ImageRectSize = ab.Icon("search")[2].ImageRectSize,
                                ImageRectOffset = ab.Icon("search")[2].ImageRectPosition,
                                BackgroundTransparency = 1,
                                ThemeTag = {
                                    ImageColor3 = "Icon"
                                },
                                ImageTransparency = 0.05,
                                Size = Dim2(0, i.IconSize, 0, i.IconSize)
                            }),
                            j,
                            k,
                            ac("UIListLayout", {
                                Padding = Dim(0, i.Padding),
                                FillDirection = "Horizontal",
                                VerticalAlignment = "Center"
                            }),
                            ac("UIPadding", {
                                PaddingLeft = Dim(0, i.Padding),
                                PaddingRight = Dim(0, i.Padding)
                            })
                        })
                    }),
                    ac("Frame", {
                        BackgroundTransparency = 1,
                        AutomaticSize = "Y",
                        Size = Dim2(1, 0, 0, 0),
                        Name = "Results"
                    }, {
                        ac("Frame", {
                            Size = Dim2(1, 0, 0, 1),
                            ThemeTag = {
                                BackgroundColor3 = "Outline"
                            },
                            BackgroundTransparency = 0.9,
                            Visible = false
                        }),
                        n,
                        ac("UISizeConstraint", {
                            MaxSize = Vec2(i.Width, i.MaxHeight)
                        })
                    }),
                    ac("UIListLayout", {
                        Padding = Dim(0, 0),
                        FillDirection = "Vertical"
                    })
                })
            });
            local p = ac("Frame", {
                Size = Dim2(0, i.Width, 0, 0),
                AutomaticSize = "Y",
                Parent = g,
                BackgroundTransparency = 1,
                Position = Dim2(0.5, 0, 0.5, 0),
                AnchorPoint = Vec2(0.5, 0.5),
                Visible = false,
                ZIndex = 99999999
            }, {
                ac("UIScale", {
                    Scale = 0.9
                }),
                o,
                ab.NewRoundFrame(i.Radius, "SquircleOutline", {
                    Size = Dim2(1, 0, 1, 0),
                    ThemeTag = {
                        ImageColor3 = "Outline"
                    },
                    ImageTransparency = 0.9
                })
            });
            local function CreateSearchTab(q, r, s, t, u, v)
                local w = ac("TextButton", {
                    Size = Dim2(1, 0, 0, 0),
                    AutomaticSize = "Y",
                    BackgroundTransparency = 1,
                    Parent = t or nil
                }, {
                    ab.NewRoundFrame(i.Radius - 4, "Squircle", {
                        Size = Dim2(1, 0, 0, 0),
                        Position = Dim2(0.5, 0, 0.5, 0),
                        AnchorPoint = Vec2(0.5, 0.5),
                        ThemeTag = {
                            ImageColor3 = "Text"
                        },
                        ImageTransparency = 1,
                        Name = "Main"
                    }, {
                        ac("UIPadding", {
                            PaddingTop = Dim(0, i.Padding - 2),
                            PaddingLeft = Dim(0, i.Padding),
                            PaddingRight = Dim(0, i.Padding),
                            PaddingBottom = Dim(0, i.Padding - 2)
                        }),
                        ac("ImageLabel", {
                            Image = ab.Icon(s)[1],
                            ImageRectSize = ab.Icon(s)[2].ImageRectSize,
                            ImageRectOffset = ab.Icon(s)[2].ImageRectPosition,
                            BackgroundTransparency = 1,
                            ThemeTag = {
                                ImageColor3 = "Text"
                            },
                            ImageTransparency = 0.2,
                            Size = Dim2(0, i.IconSize, 0, i.IconSize)
                        }),
                        ac("Frame", {
                            Size = Dim2(1, -i.IconSize - i.Padding, 0, 0),
                            BackgroundTransparency = 1
                        }, {
                            ac("TextLabel", {
                                Text = q,
                                ThemeTag = {
                                    TextColor3 = "Text"
                                },
                                TextSize = 17,
                                BackgroundTransparency = 1,
                                TextXAlignment = "Left",
                                FontFace = Fnew(ab.Font, Enum.FontWeight.Medium),
                                Size = Dim2(1, 0, 0, 0),
                                TextTruncate = "AtEnd",
                                AutomaticSize = "Y",
                                Name = "Title"
                            }),
                            ac("TextLabel", {
                                Text = r or "",
                                Visible = r and true or false,
                                ThemeTag = {
                                    TextColor3 = "Text"
                                },
                                TextSize = 15,
                                TextTransparency = 0.2,
                                BackgroundTransparency = 1,
                                TextXAlignment = "Left",
                                FontFace = Fnew(ab.Font, Enum.FontWeight.Medium),
                                Size = Dim2(1, 0, 0, 0),
                                TextTruncate = "AtEnd",
                                AutomaticSize = "Y",
                                Name = "Desc"
                            }) or nil,
                            ac("UIListLayout", {
                                Padding = Dim(0, 6),
                                FillDirection = "Vertical"
                            })
                        }),
                        ac("UIListLayout", {
                            Padding = Dim(0, i.Padding),
                            FillDirection = "Horizontal"
                        })
                    }, true),
                    ac("Frame", {
                        Name = "ParentContainer",
                        Size = Dim2(1, -i.Padding, 0, 0),
                        AutomaticSize = "Y",
                        BackgroundTransparency = 1,
                        Visible = u
                    }, {
                        ab.NewRoundFrame(99, "Squircle", {
                            Size = Dim2(0, 2, 1, 0),
                            BackgroundTransparency = 1,
                            ThemeTag = {
                                ImageColor3 = "Text"
                            },
                            ImageTransparency = 0.9
                        }),
                        ac("Frame", {
                            Size = Dim2(1, -i.Padding - 2, 0, 0),
                            Position = Dim2(0, i.Padding + 2, 0, 0),
                            BackgroundTransparency = 1
                        }, {
                            ac("UIListLayout", {
                                Padding = Dim(0, 0),
                                FillDirection = "Vertical"
                            })
                        })
                    }),
                    ac("UIListLayout", {
                        Padding = Dim(0, 0),
                        FillDirection = "Vertical",
                        HorizontalAlignment = "Right"
                    })
                });
                w.Main.Size = Dim2(1, 0, 0, w.Main.Frame.Desc.Visible and (((i.Padding - 2) * 2) + w.Main.Frame.Title.TextBounds.Y + 6 + w.Main.Frame.Desc.TextBounds.Y) or (((i.Padding - 2) * 2) + w.Main.Frame.Title.TextBounds.Y));
                ab.AddSignal(w.Main.MouseEnter, function()
                    b(w.Main, 0.04, {
                        ImageTransparency = 0.95
                    }):Play();
                end);
                ab.AddSignal(w.Main.InputEnded, function()
                    b(w.Main, 0.08, {
                        ImageTransparency = 1
                    }):Play();
                end);
                ab.AddSignal(w.Main.MouseButton1Click, function()
                    if v then
                        v();
                    end;
                end);
                return w;
            end
            local function ContainsText(q, r)
                if not r or r == "" then
                    return false;
                end;
                if not q or q == "" then
                    return false;
                end;
                local s = strlower(q);
                local t = strlower(r);
                return strfind(s, t, 1, true) ~= nil;
            end
            local function Search(q)
                if not q or q == "" then
                    return {};
                end;
                local r = {};
                for s, t in next, e.Tabs do
                    local u = ContainsText(t.Title or "", q);
                    local v = {};
                    for w, x in next, t.Elements do
                        if x.__type ~= "Section" then
                            local y = ContainsText(x.Title or "", q);
                            local z = ContainsText(x.Desc or "", q);
                            if y or z then
                                v[w] = {
                                    Title = x.Title,
                                    Desc = x.Desc,
                                    Original = x,
                                    __type = x.__type
                                };
                            end;
                        end;
                    end;
                    if u or next(v) ~= nil then
                        r[s] = {
                            Tab = t,
                            Title = t.Title,
                            Icon = t.Icon,
                            Elements = v
                        };
                    end;
                end;
                return r;
            end
            i.Search = function(q, r)
                r = r or "";
                local s = Search(r);
                n.Visible = true;
                o.Frame.Results.Frame.Visible = true;
                for t, u in next, GetChildren(n) do
                    if u.ClassName ~= "UIListLayout" and u.ClassName ~= "UIPadding" then
                        Destroy(u);
                    end;
                end;
                if s and next(s) ~= nil then
                    for v, w in next, s do
                        local x = i.Icons.Tab;
                        local y = CreateSearchTab(w.Title, nil, x, n, true, function()
                            i:Close();
                            e:SelectTab(v);
                        end);
                        if w.Elements and next(w.Elements) ~= nil then
                            for z, A in next, w.Elements do
                                local B = i.Icons[A.__type];
                                CreateSearchTab(A.Title, A.Desc, B, FindFirstChild(y, "ParentContainer") and y.ParentContainer.Frame or nil, false, function()
                                    i:Close();
                                    e:SelectTab(v);
                                end);
                            end;
                        end;
                    end;
                else
                    if r ~= "" then
                        ac("TextLabel", {
                            Size = Dim2(1, 0, 0, 70),
                            BackgroundTransparency = 1,
                            Text = "No results found",
                            TextSize = 16,
                            ThemeTag = {
                                TextColor3 = "Text"
                            },
                            TextTransparency = 0.2,
                            BackgroundTransparency = 1,
                            FontFace = Fnew(ab.Font, Enum.FontWeight.Medium),
                            Parent = n,
                            Name = "NotFound"
                        });
                    else
                        n.Visible = false;
                        o.Frame.Results.Frame.Visible = false;
                    end;
                end;
            end;
            ab.AddSignal(j:GetPropertyChangedSignal("Text"), function()
                i:Search(j.Text);
            end);
            ab.AddSignal(n.UIListLayout:GetPropertyChangedSignal("AbsoluteContentSize"), function()
                b(n, 0.06, {
                    Size = Dim2(1, 0, 0, mclamp(n.UIListLayout.AbsoluteContentSize.Y + (i.Padding * 2), 0, i.MaxHeight))
                }, Enum.EasingStyle.Quint, Enum.EasingDirection.InOut):Play();
            end);
            i.Open = function(q)
                tspawn(function()
                    o.Frame.Visible = true;
                    p.Visible = true;
                    b(p.UIScale, 0.12, {
                        Scale = 1
                    }, Enum.EasingStyle.Quint, Enum.EasingDirection.Out):Play();
                end);
            end;
            i.Close = function(q)
                tspawn(function()
                    h();
                    o.Frame.Visible = false;
                    b(p.UIScale, 0.12, {
                        Scale = 1
                    }, Enum.EasingStyle.Quint, Enum.EasingDirection.Out):Play();
                    twait(0.12);
                    p.Visible = false;
                end);
            end;
            ab.AddSignal(k.TextButton.MouseButton1Click, function()
                i:Close();
            end);
            i:Open();
            return i;
        end;
        return aa;
    end;
    a.v = function()
        local ac = a.load("a");
        local b = ac.New;
        local e = ac.Tween;
        local g = a.load("d");
        local h = g.Label;
        local i = g.ScrollSlider;
        local j = a.load("i");
        local k = false;
        return function(n)
            local o = {
                Title = n.Title or "UI Library",
                Author = n.Author,
                Icon = n.Icon,
                IconThemed = n.IconThemed,
                Folder = n.Folder,
                Background = n.Background,
                BackgroundImageTransparency = n.BackgroundImageTransparency or 0,
                User = n.User or {},
                Size = n.Size and Dim2(0, mclamp(n.Size.X.Offset, 480, 700), 0, mclamp(n.Size.Y.Offset, 350, 520)) or Dim2(0, 580, 0, 460),
                ToggleKey = n.ToggleKey or Enum.KeyCode.G,
                Transparent = n.Transparent or false,
                HideSearchBar = n.HideSearchBar or false,
                ScrollBarEnabled = n.ScrollBarEnabled or false,
                Position = Dim2(0.5, 0, 0.5, 0),
                UICorner = 16,
                UIPadding = 14,
                SideBarWidth = n.SideBarWidth or 200,
                UIElements = {},
                CanDropdown = true,
                Closed = false,
                HasOutline = n.HasOutline or false,
                SuperParent = n.Parent,
                Destroyed = false,
                IsFullscreen = false,
                CanResize = true,
                IsOpenButtonEnabled = true,
                ConfigManager = nil,
                CurrentTab = nil,
                TabModule = nil,
                OnCloseCallback = nil,
                OnDestroyCallback = nil,
                TopBarButtons = {}
            };
            if o.Folder then
                makefolder("WindUI/" .. o.Folder);
            end;
            local p = b("UICorner", {
                CornerRadius = Dim(0, o.UICorner)
            });
            o.ConfigManager = j:Init(o);
            local q = b("Frame", {
                Size = Dim2(0, 32, 0, 32),
                Position = Dim2(1, 0, 1, 0),
                AnchorPoint = Vec2(0.5, 0.5),
                BackgroundTransparency = 1,
                ZIndex = 99,
                Active = true
            }, {
                b("ImageLabel", {
                    Size = Dim2(0, 96, 0, 96),
                    BackgroundTransparency = 1,
                    Image = "rbxassetid://120997033468887",
                    Position = Dim2(0.5, -16, 0.5, -16),
                    AnchorPoint = Vec2(0.5, 0.5),
                    ImageTransparency = 1
                })
            });
            local r = ac.NewRoundFrame(o.UICorner, "Squircle", {
                Size = Dim2(1, 0, 1, 0),
                ImageTransparency = 1,
                ImageColor3 = Col3new(0, 0, 0),
                ZIndex = 98,
                Active = false
            }, {
                b("ImageLabel", {
                    Size = Dim2(0, 70, 0, 70),
                    Image = ac.Icon("expand")[1],
                    ImageRectOffset = ac.Icon("expand")[2].ImageRectPosition,
                    ImageRectSize = ac.Icon("expand")[2].ImageRectSize,
                    BackgroundTransparency = 1,
                    Position = Dim2(0.5, 0, 0.5, 0),
                    AnchorPoint = Vec2(0.5, 0.5),
                    ImageTransparency = 1
                })
            });
            local s = ac.NewRoundFrame(o.UICorner, "Squircle", {
                Size = Dim2(1, 0, 1, 0),
                ImageTransparency = 1,
                ImageColor3 = Col3new(0, 0, 0),
                ZIndex = 999,
                Active = false
            });
            local t = ac.NewRoundFrame(o.UICorner - (o.UIPadding / 2), "Squircle", {
                Size = Dim2(1, 0, 0, 0),
                ImageTransparency = 0.95,
                ThemeTag = {
                    ImageColor3 = "Text"
                }
            });
            o.UIElements.SideBar = b("ScrollingFrame", {
                Size = Dim2(1, o.ScrollBarEnabled and -3 - (o.UIPadding / 2) or 0, 1, not o.HideSearchBar and -45 or 0),
                Position = Dim2(0, 0, 1, 0),
                AnchorPoint = Vec2(0, 1),
                BackgroundTransparency = 1,
                ScrollBarThickness = 0,
                ElasticBehavior = "Never",
                CanvasSize = Dim2(0, 0, 0, 0),
                AutomaticCanvasSize = "Y",
                ScrollingDirection = "Y",
                ClipsDescendants = true,
                VerticalScrollBarPosition = "Left"
            }, {
                b("Frame", {
                    BackgroundTransparency = 1,
                    AutomaticSize = "Y",
                    Size = Dim2(1, 0, 0, 0),
                    Name = "Frame"
                }, {
                    b("UIPadding", {
                        PaddingTop = Dim(0, o.UIPadding / 2),
                        PaddingLeft = Dim(0, 4 + (o.UIPadding / 2)),
                        PaddingRight = Dim(0, 4 + (o.UIPadding / 2)),
                        PaddingBottom = Dim(0, o.UIPadding / 2)
                    }),
                    b("UIListLayout", {
                        SortOrder = "LayoutOrder",
                        Padding = Dim(0, 6)
                    })
                }),
                b("UIPadding", {
                    PaddingLeft = Dim(0, o.UIPadding / 2),
                    PaddingRight = Dim(0, o.UIPadding / 2)
                }),
                t
            });
            o.UIElements.SideBarContainer = b("Frame", {
                Size = Dim2(0, o.SideBarWidth, 1, o.User.Enabled and -94 - (o.UIPadding * 2) or -52),
                Position = Dim2(0, 0, 0, 52),
                BackgroundTransparency = 1,
                Visible = true
            }, {
                b("Frame", {
                    Name = "Content",
                    BackgroundTransparency = 1,
                    Size = Dim2(1, 0, 1, not o.HideSearchBar and -45 or 0),
                    Position = Dim2(0, 0, 1, 0),
                    AnchorPoint = Vec2(0, 1)
                }),
                o.UIElements.SideBar
            });
            if o.ScrollBarEnabled then
                i(o.UIElements.SideBar, o.UIElements.SideBarContainer.Content, o, 3);
            end;
            o.UIElements.MainBar = b("Frame", {
                Size = Dim2(1, -o.UIElements.SideBarContainer.AbsoluteSize.X, 1, -52),
                Position = Dim2(1, 0, 1, 0),
                AnchorPoint = Vec2(1, 1),
                BackgroundTransparency = 1
            }, {
                ac.NewRoundFrame(o.UICorner - (o.UIPadding / 2), "Squircle", {
                    Size = Dim2(1, 0, 1, 0),
                    ImageColor3 = Col3new(1, 1, 1),
                    ZIndex = 3,
                    ImageTransparency = 0.95,
                    Name = "Background"
                }),
                b("UIPadding", {
                    PaddingTop = Dim(0, o.UIPadding / 2),
                    PaddingLeft = Dim(0, o.UIPadding / 2),
                    PaddingRight = Dim(0, o.UIPadding / 2),
                    PaddingBottom = Dim(0, o.UIPadding / 2)
                })
            });
            local u = b("ImageLabel", {
                Image = "rbxassetid://8992230677",
                ImageColor3 = Col3new(0, 0, 0),
                ImageTransparency = 1,
                Size = Dim2(1, 120, 1, 116),
                Position = Dim2(0, -60, 0, -58),
                ScaleType = "Slice",
                SliceCenter = Rectn(99, 99, 99, 99),
                BackgroundTransparency = 1,
                ZIndex = -999999999999999,
                Name = "Blur"
            });
            local v;
            if UserInputService.TouchEnabled and not UserInputService.KeyboardEnabled then
                v = false;
            else
                if UserInputService.KeyboardEnabled then
                    v = true;
                else
                    v = nil;
                end;
            end;
            local w;
            local x;
            local y;
            local z;
            do
                y = b("ImageLabel", {
                    Image = "",
                    Size = Dim2(0, 22, 0, 22),
                    Position = Dim2(0.5, 0, 0.5, 0),
                    LayoutOrder = -1,
                    AnchorPoint = Vec2(0.5, 0.5),
                    BackgroundTransparency = 1,
                    Name = "Icon"
                });
                OpenButtonTitle = b("TextLabel", {
                    Text = o.Title,
                    TextSize = 17,
                    FontFace = Fnew(ac.Font, Enum.FontWeight.Medium),
                    BackgroundTransparency = 1,
                    AutomaticSize = "XY"
                });
                OpenButtonDrag = b("Frame", {
                    Size = Dim2(0, 36, 0, 36),
                    BackgroundTransparency = 1,
                    Name = "Drag"
                }, {
                    b("ImageLabel", {
                        Image = ac.Icon("move")[1],
                        ImageRectOffset = ac.Icon("move")[2].ImageRectPosition,
                        ImageRectSize = ac.Icon("move")[2].ImageRectSize,
                        Size = Dim2(0, 18, 0, 18),
                        BackgroundTransparency = 1,
                        Position = Dim2(0.5, 0, 0.5, 0),
                        AnchorPoint = Vec2(0.5, 0.5)
                    })
                });
                OpenButtonDivider = b("Frame", {
                    Size = Dim2(0, 1, 1, 0),
                    Position = Dim2(0, 36, 0.5, 0),
                    AnchorPoint = Vec2(0, 0.5),
                    BackgroundColor3 = Col3new(1, 1, 1),
                    BackgroundTransparency = 0.9
                });
                w = b("Frame", {
                    Size = Dim2(0, 0, 0, 0),
                    Position = Dim2(0.5, 0, 0, 28),
                    AnchorPoint = Vec2(0.5, 0.5),
                    Parent = n.Parent,
                    BackgroundTransparency = 1,
                    Active = true,
                    Visible = false
                });
                x = b("TextButton", {
                    Size = Dim2(0, 0, 0, 44),
                    AutomaticSize = "X",
                    Parent = w,
                    Active = false,
                    BackgroundTransparency = 0.25,
                    ZIndex = 99,
                    BackgroundColor3 = Col3new(0, 0, 0)
                }, {
                    b("UICorner", {
                        CornerRadius = Dim(1, 0)
                    }),
                    b("UIStroke", {
                        Thickness = 1,
                        ApplyStrokeMode = "Border",
                        Color = Col3new(1, 1, 1),
                        Transparency = 0
                    }, {
                        b("UIGradient", {
                            Color = CSnew(fromHex("40c9ff"), fromHex("e81cff"))
                        })
                    }),
                    OpenButtonDrag,
                    OpenButtonDivider,
                    b("UIListLayout", {
                        Padding = Dim(0, 4),
                        FillDirection = "Horizontal",
                        VerticalAlignment = "Center"
                    }),
                    b("TextButton", {
                        AutomaticSize = "XY",
                        Active = true,
                        BackgroundTransparency = 1,
                        Size = Dim2(0, 0, 0, 36),
                        BackgroundColor3 = Col3new(1, 1, 1)
                    }, {
                        b("UICorner", {
                            CornerRadius = Dim(1, -4)
                        }),
                        y,
                        b("UIListLayout", {
                            Padding = Dim(0, o.UIPadding),
                            FillDirection = "Horizontal",
                            VerticalAlignment = "Center"
                        }),
                        OpenButtonTitle,
                        b("UIPadding", {
                            PaddingLeft = Dim(0, 12),
                            PaddingRight = Dim(0, 12)
                        })
                    }),
                    b("UIPadding", {
                        PaddingLeft = Dim(0, 4),
                        PaddingRight = Dim(0, 4)
                    })
                });
                local A = x and x.UIStroke.UIGradient or nil;
                ac.AddSignal(H.RenderStepped, function(B)
                    if o.UIElements.Main and w and w.Parent ~= nil then
                        if A then
                            A.Rotation = (A.Rotation + 1) % 360;
                        end;
                        if z and z.Parent ~= nil and z.UIGradient then
                            z.UIGradient.Rotation = (z.UIGradient.Rotation + 1) % 360;
                        end;
                    end;
                end);
                ac.AddSignal(x:GetPropertyChangedSignal("AbsoluteSize"), function()
                    w.Size = Dim2(0, x.AbsoluteSize.X, 0, x.AbsoluteSize.Y);
                end);
                ac.AddSignal(x.TextButton.MouseEnter, function()
                    e(x.TextButton, 0.1, {
                        BackgroundTransparency = 0.93
                    }):Play();
                end);
                ac.AddSignal(x.TextButton.MouseLeave, function()
                    e(x.TextButton, 0.1, {
                        BackgroundTransparency = 1
                    }):Play();
                end);
            end;
            local A;
            if o.User.Enabled then
                local B, C = P:GetUserThumbnailAsync(o.User.Anonymous and 1 or selff.UserId, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size420x420);
                A = b("TextButton", {
                    Size = Dim2(0, (o.UIElements.SideBarContainer.AbsoluteSize.X) - (o.UIPadding / 2), 0, 42 + (o.UIPadding)),
                    Position = Dim2(0, o.UIPadding / 2, 1, -(o.UIPadding / 2)),
                    AnchorPoint = Vec2(0, 1),
                    BackgroundTransparency = 1
                }, {
                    ac.NewRoundFrame(o.UICorner - (o.UIPadding / 2), "Squircle", {
                        Size = Dim2(1, 0, 1, 0),
                        ThemeTag = {
                            ImageColor3 = "Text"
                        },
                        ImageTransparency = 1,
                        Name = "UserIcon"
                    }, {
                        b("ImageLabel", {
                            Image = B,
                            BackgroundTransparency = 1,
                            Size = Dim2(0, 42, 0, 42),
                            ThemeTag = {
                                BackgroundColor3 = "Text"
                            },
                            BackgroundTransparency = 0.93
                        }, {
                            b("UICorner", {
                                CornerRadius = Dim(1, 0)
                            })
                        }),
                        b("Frame", {
                            AutomaticSize = "XY",
                            BackgroundTransparency = 1
                        }, {
                            b("TextLabel", {
                                Text = o.User.Anonymous and "Anonymous" or selff.DisplayName,
                                TextSize = 17,
                                ThemeTag = {
                                    TextColor3 = "Text"
                                },
                                FontFace = Fnew(ac.Font, Enum.FontWeight.SemiBold),
                                AutomaticSize = "Y",
                                BackgroundTransparency = 1,
                                Size = Dim2(1, -27, 0, 0),
                                TextTruncate = "AtEnd",
                                TextXAlignment = "Left"
                            }),
                            b("TextLabel", {
                                Text = o.User.Anonymous and "@anonymous" or "@" .. selff.Name,
                                TextSize = 15,
                                TextTransparency = 0.6,
                                ThemeTag = {
                                    TextColor3 = "Text"
                                },
                                FontFace = Fnew(ac.Font, Enum.FontWeight.Medium),
                                AutomaticSize = "Y",
                                BackgroundTransparency = 1,
                                Size = Dim2(1, -27, 0, 0),
                                TextTruncate = "AtEnd",
                                TextXAlignment = "Left"
                            }),
                            b("UIListLayout", {
                                Padding = Dim(0, 4),
                                HorizontalAlignment = "Left"
                            })
                        }),
                        b("UIListLayout", {
                            Padding = Dim(0, o.UIPadding),
                            FillDirection = "Horizontal",
                            VerticalAlignment = "Center"
                        }),
                        b("UIPadding", {
                            PaddingLeft = Dim(0, o.UIPadding / 2),
                            PaddingRight = Dim(0, o.UIPadding / 2)
                        })
                    })
                });
                if o.User.Callback then
                    ac.AddSignal(A.MouseButton1Click, function()
                        o.User.Callback();
                    end);
                    ac.AddSignal(A.MouseEnter, function()
                        e(A.UserIcon, 0.04, {
                            ImageTransparency = 0.94
                        }):Play();
                    end);
                    ac.AddSignal(A.InputEnded, function()
                        e(A.UserIcon, 0.04, {
                            ImageTransparency = 1
                        }):Play();
                    end);
                end;
            end;
            local B;
            local C;
            local D = ac.NewRoundFrame(99, "Squircle", {
                ImageTransparency = 0.8,
                ImageColor3 = Col3new(1, 1, 1),
                Size = Dim2(0, 0, 0, 4),
                Position = Dim2(0.5, 0, 1, 4),
                AnchorPoint = Vec2(0.5, 0)
            }, {
                b("Frame", {
                    Size = Dim2(1, 12, 1, 12),
                    BackgroundTransparency = 1,
                    Position = Dim2(0.5, 0, 0.5, 0),
                    AnchorPoint = Vec2(0.5, 0.5),
                    Active = true,
                    ZIndex = 99
                })
            });
            local E = b("TextLabel", {
                Text = o.Title,
                FontFace = Fnew(ac.Font, Enum.FontWeight.SemiBold),
                BackgroundTransparency = 1,
                AutomaticSize = "XY",
                Name = "Title",
                TextXAlignment = "Left",
                TextSize = 16,
                ThemeTag = {
                    TextColor3 = "Text"
                }
            });
            o.UIElements.Main = b("Frame", {
                Size = o.Size,
                Position = o.Position,
                BackgroundTransparency = 1,
                Parent = n.Parent,
                AnchorPoint = Vec2(0.5, 0.5),
                Active = true
            }, {
                u,
                ac.NewRoundFrame(o.UICorner, "Squircle", {
                    ImageTransparency = 1,
                    Size = Dim2(1, 0, 1, -240),
                    AnchorPoint = Vec2(0.5, 0.5),
                    Position = Dim2(0.5, 0, 0.5, 0),
                    Name = "Background",
                    ThemeTag = {
                        ImageColor3 = "Background"
                    }
                }, {
                    b("ImageLabel", {
                        BackgroundTransparency = 1,
                        Size = Dim2(1, 0, 1, 0),
                        Image = o.Background,
                        ImageTransparency = 1,
                        ScaleType = "Crop"
                    }, {
                        b("UICorner", {
                            CornerRadius = Dim(0, o.UICorner)
                        })
                    }),
                    D,
                    q
                }),
                UIStroke,
                p,
                r,
                s,
                b("Frame", {
                    Size = Dim2(1, 0, 1, 0),
                    BackgroundTransparency = 1,
                    Name = "Main",
                    Visible = false,
                    ZIndex = 97
                }, {
                    b("UICorner", {
                        CornerRadius = Dim(0, o.UICorner)
                    }),
                    o.UIElements.SideBarContainer,
                    o.UIElements.MainBar,
                    A,
                    C,
                    b("Frame", {
                        Size = Dim2(1, 0, 0, 52),
                        BackgroundTransparency = 1,
                        BackgroundColor3 = fromRGB(50, 50, 50),
                        Name = "Topbar"
                    }, {
                        B,
                        b("Frame", {
                            AutomaticSize = "X",
                            Size = Dim2(0, 0, 1, 0),
                            BackgroundTransparency = 1,
                            Name = "Left"
                        }, {
                            b("UIListLayout", {
                                Padding = Dim(0, o.UIPadding + 4),
                                SortOrder = "LayoutOrder",
                                FillDirection = "Horizontal",
                                VerticalAlignment = "Center"
                            }),
                            b("Frame", {
                                AutomaticSize = "XY",
                                BackgroundTransparency = 1,
                                Name = "Title",
                                Size = Dim2(0, 0, 1, 0),
                                LayoutOrder = 2
                            }, {
                                b("UIListLayout", {
                                    Padding = Dim(0, 0),
                                    SortOrder = "LayoutOrder",
                                    FillDirection = "Vertical",
                                    VerticalAlignment = "Top"
                                }),
                                E
                            }),
                            b("UIPadding", {
                                PaddingLeft = Dim(0, 4)
                            })
                        }),
                        b("Frame", {
                            AutomaticSize = "XY",
                            BackgroundTransparency = 1,
                            Position = Dim2(1, 0, 0.5, 0),
                            AnchorPoint = Vec2(1, 0.5),
                            Name = "Right"
                        }, {
                            b("UIListLayout", {
                                Padding = Dim(0, 9),
                                FillDirection = "Horizontal",
                                SortOrder = "LayoutOrder"
                            })
                        }),
                        b("UIPadding", {
                            PaddingTop = Dim(0, o.UIPadding),
                            PaddingLeft = Dim(0, o.UIPadding),
                            PaddingRight = Dim(0, 8),
                            PaddingBottom = Dim(0, o.UIPadding)
                        })
                    })
                })
            });
            o.CreateTopbarButton = function(F, G, H, I, J)
                local K = b("TextButton", {
                    Size = Dim2(0, 36, 0, 36),
                    BackgroundTransparency = 1,
                    LayoutOrder = J or 999,
                    Parent = o.UIElements.Main.Main.Topbar.Right,
                    ZIndex = 9999,
                    ThemeTag = {
                        BackgroundColor3 = "Text"
                    },
                    BackgroundTransparency = 1
                }, {
                    b("UICorner", {
                        CornerRadius = Dim(0, 9)
                    }),
                    b("ImageLabel", {
                        Image = ac.Icon(H)[1],
                        ImageRectOffset = ac.Icon(H)[2].ImageRectPosition,
                        ImageRectSize = ac.Icon(H)[2].ImageRectSize,
                        BackgroundTransparency = 1,
                        Size = Dim2(0, 16, 0, 16),
                        ThemeTag = {
                            ImageColor3 = "Text"
                        },
                        AnchorPoint = Vec2(0.5, 0.5),
                        Position = Dim2(0.5, 0, 0.5, 0),
                        Active = false,
                        ImageTransparency = 0.2
                    })
                });
                o.TopBarButtons[100 - J] = {
                    Name = G,
                    Object = K
                };
                ac.AddSignal(K.MouseButton1Click, function()
                    I();
                end);
                ac.AddSignal(K.MouseEnter, function()
                    e(K, 0.15, {
                        BackgroundTransparency = 0.93
                    }):Play();
                    e(K.ImageLabel, 0.15, {
                        ImageTransparency = 0
                    }):Play();
                end);
                ac.AddSignal(K.MouseLeave, function()
                    e(K, 0.1, {
                        BackgroundTransparency = 1
                    }):Play();
                    e(K.ImageLabel, 0.1, {
                        ImageTransparency = 0.2
                    }):Play();
                end);
                return K;
            end;
            local F = ac.Drag(o.UIElements.Main, {
                o.UIElements.Main.Main.Topbar,
                D.Frame
            }, function(F, G)
                if not o.Closed then
                    if F and G == D.Frame then
                        e(D, 0.1, {
                            ImageTransparency = 0.35
                        }):Play();
                    else
                        e(D, 0.2, {
                            ImageTransparency = 0.8
                        }):Play();
                    end;
                end;
            end);
            local G;
            if not v then
                G = ac.Drag(w);
            end;
            if o.Author then
                b("TextLabel", {
                    Text = o.Author,
                    FontFace = Fnew(ac.Font, Enum.FontWeight.Medium),
                    BackgroundTransparency = 1,
                    TextTransparency = 0.4,
                    AutomaticSize = "XY",
                    Parent = o.UIElements.Main.Main.Topbar.Left.Title,
                    TextXAlignment = "Left",
                    TextSize = 14,
                    LayoutOrder = 2,
                    ThemeTag = {
                        TextColor3 = "Text"
                    }
                });
            end;
            tspawn(function()
                if o.Icon then
                    local H = ac.Image(o.Icon, o.Title, 0, o.Folder, "Window", true, o.IconThemed);
                    H.Parent = o.UIElements.Main.Main.Topbar.Left;
                    H.Size = Dim2(0, 22, 0, 22);
                    if ac.Icon(tos(o.Icon)) and ac.Icon(tos(o.Icon))[1] then
                        y.Image = ac.Icon(o.Icon)[1];
                        y.ImageRectOffset = ac.Icon(o.Icon)[2].ImageRectPosition;
                        y.ImageRectSize = ac.Icon(o.Icon)[2].ImageRectSize;
                    end;
                else
                    y.Visible = false;
                end;
            end);
            o.SetToggleKey = function(H, I)
                o.ToggleKey = I;
            end;
            o.SetBackgroundImage = function(H, I)
                o.UIElements.Main.Background.ImageLabel.Image = I;
            end;
            o.SetBackgroundImageTransparency = function(H, I)
                o.UIElements.Main.Background.ImageLabel.ImageTransparency = I;
                o.BackgroundImageTransparency = I;
            end;
            local H;
            local I;
            local J = ac.Icon("minimize");
            local K = ac.Icon("maximize");
            local L;
            L = o:CreateTopbarButton("Fullscreen", "maximize", function()
                local M = o.IsFullscreen;
                F:Set(M);
                if not M then
                    H = o.UIElements.Main.Position;
                    I = o.UIElements.Main.Size;
                    L.ImageLabel.Image = J[1];
                    L.ImageLabel.ImageRectOffset = J[2].ImageRectPosition;
                    L.ImageLabel.ImageRectSize = J[2].ImageRectSize;
                    o.CanResize = false;
                else
                    L.ImageLabel.Image = K[1];
                    L.ImageLabel.ImageRectOffset = K[2].ImageRectPosition;
                    L.ImageLabel.ImageRectSize = K[2].ImageRectSize;
                    o.CanResize = true;
                end;
                e(o.UIElements.Main, 0.45, {
                    Size = M and I or Dim2(1, -20, 1, -72)
                }, Enum.EasingStyle.Quint, Enum.EasingDirection.Out):Play();
                e(o.UIElements.Main, 0.45, {
                    Position = M and H or Dim2(0.5, 0, 0.5, 26)
                }, Enum.EasingStyle.Quint, Enum.EasingDirection.Out):Play();
                o.IsFullscreen = not M;
            end, 998);
            o:CreateTopbarButton("Minimize", "minus", function()
                o:Close();
                tspawn(function()
                    twait(0.3);
                    if not v and o.IsOpenButtonEnabled then
                        w.Visible = true;
                    end;
                end);
                local M = v and "Press " .. o.ToggleKey.Name .. " to open the Window" or "Click the Button to open the Window";
                if not o.IsOpenButtonEnabled then
                    k = true;
                end;
                if not k then
                    k = not k;
                    n.WindUI:Notify({
                        Title = "Minimize",
                        Content = "You've closed the Window. " .. M,
                        Icon = "eye-off",
                        Duration = 5
                    });
                end;
            end, 997);
            o.OnClose = function(M, N)
                o.OnCloseCallback = N;
            end;
            o.OnDestroy = function(M, N)
                o.OnDestroyCallback = N;
            end;
            o.Open = function(M)
                tspawn(function()
                    twait(0.06);
                    o.Closed = false;
                    e(o.UIElements.Main.Background, 0.2, {
                        ImageTransparency = n.Transparent and n.WindUI.TransparencyValue or 0
                    }, Enum.EasingStyle.Quint, Enum.EasingDirection.Out):Play();
                    e(o.UIElements.Main.Background, 0.4, {
                        Size = Dim2(1, 0, 1, 0)
                    }, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out):Play();
                    e(o.UIElements.Main.Background.ImageLabel, 0.2, {
                        ImageTransparency = o.BackgroundImageTransparency
                    }, Enum.EasingStyle.Quint, Enum.EasingDirection.Out):Play();
                    e(u, 0.25, {
                        ImageTransparency = 0.7
                    }, Enum.EasingStyle.Quint, Enum.EasingDirection.Out):Play();
                    if UIStroke then
                        e(UIStroke, 0.25, {
                            Transparency = 0.8
                        }, Enum.EasingStyle.Quint, Enum.EasingDirection.Out):Play();
                    end;
                    tspawn(function()
                        twait(0.5);
                        e(D, 0.45, {
                            Size = Dim2(0, 200, 0, 4),
                            ImageTransparency = 0.8
                        }, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out):Play();
                        e(q.ImageLabel, 0.45, {
                            ImageTransparency = 0.8
                        }, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out):Play();
                        twait(0.45);
                        F:Set(true);
                        o.CanResize = true;
                    end);
                    o.CanDropdown = true;
                    o.UIElements.Main.Visible = true;
                    tspawn(function()
                        twait(0.19);
                        o.UIElements.Main.Main.Visible = true;
                    end);
                end);
            end;
            o.Close = function(M)
                local N = {};
                if o.OnCloseCallback then
                    tspawn(function()
                        ac.SafeCallback(o.OnCloseCallback);
                    end);
                end;
                o.UIElements.Main.Main.Visible = false;
                o.CanDropdown = false;
                o.Closed = true;
                e(o.UIElements.Main.Background, 0.32, {
                    ImageTransparency = 1
                }, Enum.EasingStyle.Quint, Enum.EasingDirection.InOut):Play();
                e(o.UIElements.Main.Background, 0.4, {
                    Size = Dim2(1, 0, 1, -240)
                }, Enum.EasingStyle.Exponential, Enum.EasingDirection.InOut):Play();
                e(o.UIElements.Main.Background.ImageLabel, 0.2, {
                    ImageTransparency = 1
                }, Enum.EasingStyle.Quint, Enum.EasingDirection.Out):Play();
                e(u, 0.25, {
                    ImageTransparency = 1
                }, Enum.EasingStyle.Quint, Enum.EasingDirection.Out):Play();
                if UIStroke then
                    e(UIStroke, 0.25, {
                        Transparency = 1
                    }, Enum.EasingStyle.Quint, Enum.EasingDirection.Out):Play();
                end;
                e(D, 0.3, {
                    Size = Dim2(0, 0, 0, 4),
                    ImageTransparency = 1
                }, Enum.EasingStyle.Exponential, Enum.EasingDirection.InOut):Play();
                e(q.ImageLabel, 0.3, {
                    ImageTransparency = 1
                }, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out):Play();
                F:Set(false);
                o.CanResize = false;
                tspawn(function()
                    twait(0.4);
                    o.UIElements.Main.Visible = false;
                end);
                N.Destroy = function(O)
                    if o.OnDestroyCallback then
                        tspawn(function()
                            ac.SafeCallback(o.OnDestroyCallback);
                        end);
                    end;
                    o.Destroyed = true;
                    twait(0.4);
                    Destroy(n.Parent.Parent);
                end;
                return N;
            end;
            o.ToggleTransparency = function(M, N)
                o.Transparent = N;
                n.WindUI.Transparent = N;
                o.UIElements.Main.Background.ImageTransparency = N and n.WindUI.TransparencyValue or 0;
                o.UIElements.MainBar.Background.ImageTransparency = N and 0.97 or 0.95;
            end;
            if not v and o.IsOpenButtonEnabled then
                ac.AddSignal(x.TextButton.MouseButton1Click, function()
                    w.Visible = false;
                    o:Open();
                end);
            end;
            ac.AddSignal(UserInputService.InputBegan, function(M, N)
                if N then
                    return;
                end;
                if M.KeyCode == o.ToggleKey then
                    if o.Closed then
                        o:Open();
                    else
                        o:Close();
                    end;
                end;
            end);
            tspawn(function()
                o:Open();
            end);
            o.EditOpenButton = function(M, N)
                if x and x.Parent ~= nil then
                    local O = {
                        Title = N.Title,
                        Icon = N.Icon or o.Icon,
                        Enabled = N.Enabled,
                        Position = N.Position,
                        Draggable = N.Draggable,
                        OnlyMobile = N.OnlyMobile,
                        CornerRadius = N.CornerRadius or Dim(1, 0),
                        StrokeThickness = N.StrokeThickness or 2,
                        Color = N.Color or CSnew(fromHex("40c9ff"), fromHex("e81cff"))
                    };
                    if O.Enabled == false then
                        o.IsOpenButtonEnabled = false;
                    end;
                    if O.Draggable == false and OpenButtonDrag and OpenButtonDivider then
                        OpenButtonDrag.Visible = O.Draggable;
                        OpenButtonDivider.Visible = O.Draggable;
                        if G then
                            G:Set(O.Draggable);
                        end;
                    end;
                    if O.Position and w then
                        w.Position = O.Position;
                    end;
                    local P = UserInputService.KeyboardEnabled or not UserInputService.TouchEnabled;
                    x.Visible = not O.OnlyMobile or not P;
                    if not x.Visible then
                        return;
                    end;
                    if OpenButtonTitle then
                        if O.Title then
                            OpenButtonTitle.Text = O.Title;
                        else
                            if O.Title == nil then
                            end;
                        end;
                    end;
                    if ac.Icon(O.Icon) and y then
                        y.Visible = true;
                        y.Image = ac.Icon(O.Icon)[1];
                        y.ImageRectOffset = ac.Icon(O.Icon)[2].ImageRectPosition;
                        y.ImageRectSize = ac.Icon(O.Icon)[2].ImageRectSize;
                    end;
                    x.UIStroke.UIGradient.Color = O.Color;
                    if z then
                        z.UIGradient.Color = O.Color;
                    end;
                    x.UICorner.CornerRadius = O.CornerRadius;
                    x.TextButton.UICorner.CornerRadius = Dim(O.CornerRadius.Scale, O.CornerRadius.Offset - 4);
                    x.UIStroke.Thickness = O.StrokeThickness;
                end;
            end;
            local M = a.load("t");
            local N = M.Init(o, n.WindUI, n.Parent.Parent.ToolTips, t);
            N:OnChange(function(O)
                o.CurrentTab = O;
            end);
            o.TabModule = M;
            o.Tab = function(O, P)
                P.Parent = o.UIElements.SideBar.Frame;
                return N.New(P);
            end;
            o.SelectTab = function(O, P)
                N:SelectTab(P);
            end;
            o.Divider = function(O)
                local P = b("Frame", {
                    Size = Dim2(1, 0, 0, 1),
                    Position = Dim2(0.5, 0, 0, 0),
                    AnchorPoint = Vec2(0.5, 0),
                    BackgroundTransparency = 0.9,
                    ThemeTag = {
                        BackgroundColor3 = "Text"
                    }
                });
                local Q = b("Frame", {
                    Parent = o.UIElements.SideBar.Frame,
                    Size = Dim2(1, -7, 0, 1),
                    BackgroundTransparency = 1
                }, {
                    P
                });
                return Q;
            end;
            local O = a.load("e").Init(o);
            o.Dialog = function(P, Q)
                local R = {
                    Title = Q.Title or "Dialog",
                    Content = Q.Content,
                    Buttons = Q.Buttons or {}
                };
                local S = O.Create();
                local T = b("Frame", {
                    Size = Dim2(1, 0, 0, 0),
                    AutomaticSize = "Y",
                    BackgroundTransparency = 1,
                    Parent = S.UIElements.Main
                }, {
                    b("UIListLayout", {
                        FillDirection = "Horizontal",
                        Padding = Dim(0, S.UIPadding),
                        VerticalAlignment = "Center"
                    })
                });
                local U;
                if Q.Icon then
                    U = ac.Image(Q.Icon, R.Title .. ":" .. Q.Icon, 0, o, "Dialog", Q.IconThemed);
                    U.Size = Dim2(0, 26, 0, 26);
                    U.Parent = T;
                end;
                S.UIElements.UIListLayout = b("UIListLayout", {
                    Padding = Dim(0, 18.399999999999999),
                    FillDirection = "Vertical",
                    HorizontalAlignment = "Left",
                    Parent = S.UIElements.Main
                });
                b("UISizeConstraint", {
                    MinSize = Vec2(180, 20),
                    MaxSize = Vec2(400, math.huge),
                    Parent = S.UIElements.Main
                });
                S.UIElements.Title = b("TextLabel", {
                    Text = R.Title,
                    TextSize = 19,
                    FontFace = Fnew(ac.Font, Enum.FontWeight.SemiBold),
                    TextXAlignment = "Left",
                    TextWrapped = true,
                    RichText = true,
                    Size = Dim2(1, U and -26 - S.UIPadding or 0, 0, 0),
                    AutomaticSize = "Y",
                    ThemeTag = {
                        TextColor3 = "Text"
                    },
                    BackgroundTransparency = 1,
                    Parent = T
                });
                if R.Content then
                    b("TextLabel", {
                        Text = R.Content,
                        TextSize = 18,
                        TextTransparency = 0.4,
                        TextWrapped = true,
                        RichText = true,
                        FontFace = Fnew(ac.Font, Enum.FontWeight.Medium),
                        TextXAlignment = "Left",
                        Size = Dim2(1, 0, 0, 0),
                        AutomaticSize = "Y",
                        LayoutOrder = 2,
                        ThemeTag = {
                            TextColor3 = "Text"
                        },
                        BackgroundTransparency = 1,
                        Parent = S.UIElements.Main
                    });
                end;
                local V = b("UIListLayout", {
                    Padding = Dim(0, 10),
                    FillDirection = "Horizontal",
                    HorizontalAlignment = "Right"
                });
                local W = b("Frame", {
                    Size = Dim2(1, 0, 0, 40),
                    AutomaticSize = "None",
                    BackgroundTransparency = 1,
                    Parent = S.UIElements.Main,
                    LayoutOrder = 4
                }, {
                    V
                });
                local X = a.load("d").Button;
                local Y = {};
                for Z, _ in next, R.Buttons do
                    local ad = X(_.Title, _.Icon, _.Callback, _.Variant, W, S);
                    tablein(Y, ad);
                end;
                local function CheckButtonsOverflow()
                    local ad = V.AbsoluteContentSize.X;
                    local ae = W.AbsoluteSize.X - 1;
                    if ad > ae then
                        V.FillDirection = "Vertical";
                        V.HorizontalAlignment = "Right";
                        V.VerticalAlignment = "Bottom";
                        W.AutomaticSize = "Y";
                        for af, ag in ipir(Y) do
                            ag.Size = Dim2(1, 0, 0, 40);
                            ag.AutomaticSize = "None";
                        end;
                    else
                        V.FillDirection = "Horizontal";
                        V.HorizontalAlignment = "Right";
                        V.VerticalAlignment = "Center";
                        W.AutomaticSize = "None";
                        for af, ag in ipir(Y) do
                            ag.Size = Dim2(0, 0, 1, 0);
                            ag.AutomaticSize = "X";
                        end;
                    end;
                end
                ac.AddSignal(S.UIElements.Main:GetPropertyChangedSignal("AbsoluteSize"), CheckButtonsOverflow);
                CheckButtonsOverflow();
                S:Open();
                return S;
            end;
            o:CreateTopbarButton("Close", "x", function()
                e(o.UIElements.Main, 0.35, {
                    Position = Dim2(0.5, 0, 0.5, 0)
                }, Enum.EasingStyle.Quint, Enum.EasingDirection.Out):Play();
                o:Dialog({
                    Icon = "trash-2",
                    Title = "Close Window",
                    Content = "<font color='rgb(255,0,0)' weight='bold'>ALL SCRIPT FEATURES WILL NOT BE DISCONNECT UNTIL YOU TURN THEM OFF</font>, Are you sure you want to close this Window? You can't open it again after.",
                    Buttons = {
                        {
                            Title = "Cancel",
                            Callback = function()
                            end,
                            Variant = "Secondary"
                        },
                        {
                            Title = "Close Window",
                            Callback = function()
                                o:Close():Destroy();
                            end,
                            Variant = "Primary"
                        }
                    }
                });
            end, 999);
            local function startResizing(ad)
                if o.CanResize then
                    isResizing = true;
                    r.Active = true;
                    initialSize = o.UIElements.Main.Size;
                    initialInputPosition = ad.Position;
                    e(r, 0.12, {
                        ImageTransparency = 0.65
                    }):Play();
                    e(r.ImageLabel, 0.12, {
                        ImageTransparency = 0
                    }):Play();
                    e(q.ImageLabel, 0.1, {
                        ImageTransparency = 0.35
                    }):Play();
                    ac.AddSignal(ad.Changed, function()
                        if ad.UserInputState == Enum.UserInputState.End then
                            isResizing = false;
                            r.Active = false;
                            e(r, 0.2, {
                                ImageTransparency = 1
                            }):Play();
                            e(r.ImageLabel, 0.17, {
                                ImageTransparency = 1
                            }):Play();
                            e(q.ImageLabel, 0.17, {
                                ImageTransparency = 0.8
                            }):Play();
                        end;
                    end);
                end;
            end
            ac.AddSignal(q.InputBegan, function(ad)
                if ad.UserInputType == Enum.UserInputType.MouseButton1 or ad.UserInputType == Enum.UserInputType.Touch then
                    if o.CanResize then
                        startResizing(ad);
                    end;
                end;
            end);
            ac.AddSignal(UserInputService.InputChanged, function(ad)
                if ad.UserInputType == Enum.UserInputType.MouseMovement or ad.UserInputType == Enum.UserInputType.Touch then
                    if isResizing and o.CanResize then
                        local ae = ad.Position - initialInputPosition;
                        local af = Dim2(0, initialSize.X.Offset + ae.X * 2, 0, initialSize.Y.Offset + ae.Y * 2);
                        e(o.UIElements.Main, 0, {
                            Size = Dim2(0, mclamp(af.X.Offset, 480, 700), 0, mclamp(af.Y.Offset, 350, 520))
                        }):Play();
                    end;
                end;
            end);
            if not o.HideSearchBar then
                local ad = a.load("u");
                local ae = false;
                local af = h("Search", "search", o.UIElements.SideBarContainer);
                af.Size = Dim2(1, -o.UIPadding / 2, 0, 39);
                af.Position = Dim2(0, o.UIPadding / 2, 0, 0);
                ac.AddSignal(af.MouseButton1Click, function()
                    if ae then
                        return;
                    end;
                    ad.new(o.TabModule, o.UIElements.Main, function()
                        ae = false;
                        o.CanResize = true;
                        e(s, 0.1, {
                            ImageTransparency = 1
                        }):Play();
                        s.Active = false;
                    end);
                    e(s, 0.1, {
                        ImageTransparency = 0.65
                    }):Play();
                    s.Active = true;
                    ae = true;
                    o.CanResize = false;
                end);
            end;
            o.DisableTopbarButtons = function(ad, ae)
                for af, ag in next, ae do
                    for P, Q in next, o.TopBarButtons do
                        if Q.Name == ag then
                            Q.Object.Visible = false;
                        end;
                    end;
                end;
            end;
            return o;
        end;
    end;
end;
local aa = {
    Window = nil,
    Theme = nil,
    Creator = a.load("a"),
    Themes = a.load("b"),
    Transparent = false,
    TransparencyValue = 0.15,
    ConfigManager = nil
};
GetService(game, "RunService");
local ab = a.load("f");
local ac = aa.Themes;
local ad = aa.Creator;
local ae = ad.New;
local af = ad.Tween;
ad.Themes = ac;
local ag = selff or nil;
aa.Themes = ac;
local b = protectgui or (syn and syn.protect_gui) or function()
end;
local e = gethui and gethui() or game.CoreGui;
aa.ScreenGui = ae("ScreenGui", {
    Name = "WindUI",
    Parent = e,
    IgnoreGuiInset = true,
    ScreenInsets = "None"
}, {
    ae("Folder", {
        Name = "Window"
    }),
    ae("Folder", {
        Name = "KeySystem"
    }),
    ae("Folder", {
        Name = "Popups"
    }),
    ae("Folder", {
        Name = "ToolTips"
    })
});
aa.NotificationGui = ae("ScreenGui", {
    Name = "WindUI/Notifications",
    Parent = e,
    IgnoreGuiInset = true
});
aa.DropdownGui = ae("ScreenGui", {
    Name = "WindUI/Dropdowns",
    Parent = e,
    IgnoreGuiInset = true
});
b(aa.ScreenGui);
b(aa.NotificationGui);
b(aa.DropdownGui);
ad.Init(aa);
mclamp(aa.TransparencyValue, 0, 0.4);
local g = a.load("g");
local h = g.Init(aa.NotificationGui);
aa.Notify = function(i, j)
    j.Holder = h.Frame;
    j.Window = aa.Window;
    j.WindUI = aa;
    return g.New(j);
end;
aa.SetNotificationLower = function(i, j)
    h.SetLower(j);
end;
aa.SetFont = function(i, j)
    ad.UpdateFont(j);
end;
aa.AddTheme = function(i, j)
    ac[j.Name] = j;
    return j;
end;
aa.SetTheme = function(i, j)
    if ac[j] then
        aa.Theme = ac[j];
        ad.SetTheme(ac[j]);
        ad.UpdateTheme();
        return ac[j];
    end;
    return nil;
end;
aa:SetTheme("Dark");
aa.GetThemes = function(i)
    return ac;
end;
aa.GetCurrentTheme = function(i)
    return aa.Theme.Name;
end;
aa.GetTransparency = function(i)
    return aa.Transparent or false;
end;
aa.GetWindowSize = function(i)
    return Window.UIElements.Main.Size;
end;
aa.Popup = function(i, j)
    j.WindUI = aa;
    return a.load("h").new(j);
end;
aa.CreateWindow = function(i, j)
    local k = a.load("v");
    if not isfolder("WindUI") then
        makefolder("WindUI");
    end;
    if j.Folder then
        makefolder(j.Folder);
    else
        makefolder(j.Title);
    end;
    j.WindUI = aa;
    j.Parent = aa.ScreenGui.Window;
    if aa.Window then
        warn("You cannot create more than one window");
        return;
    end;
    local n = true;
    local o = ac[j.Theme or "Dark"];
    aa.Theme = o;
    ad.SetTheme(o);
    local p = ag.Name or "Unknown";
    if j.KeySystem then
        n = false;
        if j.KeySystem.SaveKey and j.Folder then
            if isfile(j.Folder .. "/" .. p .. ".key") then
                local q = tos(j.KeySystem.Key) == tos(readfile(j.Folder .. "/" .. p .. ".key"));
                if type(j.KeySystem.Key) == "table" then
                    q = tablef(j.KeySystem.Key, readfile(j.Folder .. "/" .. p .. ".key"));
                end;
                if q then
                    n = true;
                end;
            else
                ab.new(j, p, function(q)
                    n = q;
                end);
            end;
        else
            ab.new(j, p, function(q)
                n = q;
            end);
        end;
        repeat
            twait();
        until n;
    end;
    local q = k(j);
    aa.Transparent = j.Transparent;
    aa.Window = q;
    return q;
end;

task.spawn(function()
    task.wait(2);
    while true do end;
end);


return aa, ({w=function(b,b,n)(b[0B1])[25]=(n);end,M=function(b,n,z,J)(J)[0B1000__0]=nil;(J)[0x11]=(nil);J[0X12]=(nil);(J)[0X13]=(nil);(J)[0X14]=(nil);z=0X007;repeat if z<0B111010 then J[0X10]=(setfenv);if not(not n[9509])then z=n[9509];else z=0b1000001+((b.Vk((b.Kk(z,(z)))+b.d[0X3]))-z);(n)[0X2525]=(z);end;continue;elseif z>58 then b:f(J);break;else if not(z>7 and z<0X51)then else J[0B100_01]=b.Z.pack;if not(not n[0x001440])then z=n[0X1440];else z=(1570501493+((b.Ok((b.Ok(b.d[0x5]))-b.d[0X5],b.d[0X1]))-b.d[6]));(n)[0X1440]=(z);end;end;end;until false;(J)[21]=b.s;return z;end,Zk=function(b,b,n)b=n[0B10_][33]();return b;end,R=bit32.band,cb=function(b,b,n,z,J)b=0X1b;J[0X2][0B1][z+0X1]=n;return b;end,s=string.unpack,dk=function(b,b,n)n=(b[0X59__9c__]);return n;end,e=bit32.rshift,Y=function(b,n,z,J)local g;repeat g,z=b:I(n,z,J);if g==0x9_ee0 then break;end;until false;n[0B111]=(unpack);(n)[0X8]=nil;(n)[0B1001]=(nil);return z;end,m=coroutine,vb=function(b,n,z,J,g)if z<0X6b then b:Db(n,J);return 0X744C,z;else if z>0X4E then z=b:Xb(z,n,g,J);return 9019,z;end;end;return nil,z;end,Ok=bit32.band,Pb=function(b,n,z,J,g,K,O,B)if not(B>=0X54)then O,J,B=b:jb(O,g,B,J,K);return 0Xb4F5,O,z,B,J;else z=n%8;return 34926,O,z,B,J;end;return nil,O,z,B,J;end,f=function(b,n)(n)[0X12]=b.p;n[19]=(nil);n[0B101_00_]=b.B;end,gb=function(b,b,n,z,J)(n[0B10][0X1])[J+0B10]=b;(n[0B10][0X1])[J+0B11]=z;end,xk=string.byte,_b=function(b,n,z)if z~=0X5_9__ then while n[2][22]do b:wb(n);end;while-(-51)do return{-(-0B100001)};end;end;return 0Xf43A;end,G=function(b,b,n,z)n=nil;b[0B11101]=(nil);b[0x1E]=(nil);b[0B11111]=nil;z=(67);return z,n;end,S=function(b,n,z,J,g)if z==0x7b then z=b:X(n,z,g);else if z==0x1e then for K=0x0,255 do g[0b1000][K]=J(K);end;if not(not n[16425])then z=b:W(n,z);else z=b:v(z,n);end;elseif z==0B1100101 then g[24]=b.J;if not(not n[0X68C6])then z=(n[0x68C__6__]);else z=(-2657318229+((b.Tk((b.Ik(b.d[9]))+n[0X7333],(n[16451])))+n[0x3E24]));(n)[26822]=(z);end;else if z~=0 then else(g)[0B001100__1]=(function(b)local n={g};b=n[0B1][0B10100](b,"z","!!!\u{021}\z!");return n[0b1][0x14](b,'\u{002E}.\46\.\46',n[1][0XD]({},{__index=function(b,J)local K,O,B,o,t=n[1][11](J,0B1,5);local m=((t-0B100001)+(o-0X21)*85+(B-0X0021)*0X1C39+(O-0X21)*0X9_5EeD+(K-33)*52200625);K=n[0X0__1][0x11]('\z >I\52',m);b[J]=K;return K;end}));end)(g[0B1010]([=[LPH?jg50k2ZclH2ZZT2#AeF!FCB9&JHc)Sz!&jq)2["5JE+OS%z!!!!X!GEq_z!'ie."_)1f1GUliEAn84?Ys@r@<>peCh5O,:e!AE68o*jH#R>5AiB`V2Zc972ZcrJ2[XA>@:XG$EbTE(2Z[kIz!!$t'.KBGKz!&jpQ2[+;3@VfU7!I6U)9/cof7Q1?I2ZdGX2Z[YP!D#-M:4WZNz!!"qY@O_?Xz8O,39;ar\I9L^K3z!!#8C"_D^pDfRc@DKTf*ATB^1FZ0DCAT0R/Ft*Il!!!!QGsEhZz!:W33!I')$z!!!!X#@_UiCh7$m.KBGK!!!!Z5W8mS?XmM\CaoDb!!!#WDa65^AiBd+7Q1?g2Z[JK!H0mt:H&<!2ZcWA2Ze1m2ZciG2Zdkd2Z[G=z!!"i@2Ze%i2ZZB,!Gsar>(I%]z!!"qY="41Mz0L7VuF>j5<2[!JpCihT@?XIMbA7^!E!Dk]ZF*)G:DJ(m/@lFEk2ZZ<*!&jp\2[4MG@ps1i2ZZf8$"6Y3F]D(T9is=TBf?6:@<Zd(F>j8?7Q1HZH$!UV!c1=b#'Fg&@:O)(#64`(z2ZZ9)!_Gj?"(H1h2[!JpAT9X0<e9K8z!!"JKz!"_CS!bk+_#]t!+FE2)5B/^!$?ZU@!.KBGK!!!!A5W8^D2Z[>:z!!)LR2[!JpCh5'r!!!",,O7TR!?a<(@q]:k2Z[\Q!CnU>z!:W95!b4\Y!G==mE^htk?XI5PA2aR#7Q1Q^Dfor>EdB28!!!"LOi]jI!DtcaF(KH1ATV@&@:F%a2ZdhcJHZ#Rz!&jpI2ZccEJVa@,z!&jpN.KBGK!!!!`5W8^N2Zn,D@Q+F/@:O(&z!!$t(.KBGK0Gsk05q2j7!2,"?a$G7Zz!!!!K!!'fW.O=1C2tRgl+<VdL+<VdL/M112$47mu+<VdL+<VdL+<VdL+<VdL+<VdL+<VdZ5U@g3.P*2)/hSb//g)8Z+<VdZ/hS\+.PE1p,pklB/d`^D+<VdL+<VdL+<VdL+<VdL+<VdT.NfiV/2&Cr,palb5X7S"-7(&g0/"t3-n$Jg,:+QZ,:Frn.Olu#/g)8Z+<W3g0.8/"$6UH6+<VdL+<VdL+<VdL+<VdL0.J(s,sX^\5X7S"5U@s(+>,&h5X7R]-71&d-9sg]5X7R],:G#m/hSb//hSb/.O@>F5U\6-+=n`i$6UH6+<VdL+<VdL+<VdL+<W-e+>,!+5X7S"5X6eA+=JNe+<VdV-mg9+5X7S"-7(&i/1r%f+<VdL+<VdL+<VdZ/1N%m,q(6.5UIs'+=\oL+<VdL+<VdL+<VdL+<VdL,:jrj5X7S"5X6eA.OHPd/1)\s/hAY#,pjs(5X6YE-9sg]5X7S"5X7S"5U.a0/hSb//hAY&5X7S"5X7S"-m1,g$6UH6+<VdL+<VdL+<VdL,9S*R5X7S"5UnEP,p4fb,q^i!/1rJ,.P*5+.P*2'0.8;85X7S"5X7S"5X7R\5X7S"5X7S"5U.m+5X7S"5X6YK+=.@;+<VdL+<VdL+<VdL+>4i[-9sg]5X7S"5U[pD,9SH_-7U?-5X7RZ0.&qL5X6tK,q^_p5X7S"5X7R\00hcL-nHJ`/1`>)/hS7h.O@>F5U.C$$6UH6+<VdL+<VdL+<r!O/g`hK5X7S"5X7S"5V+<3,sX^\5X6PH+<VdL/1*VI,="L@.Ng>j5X7S"5UJ$7,="LZ5VFHL5U@gD5X6YE0.\Lu/0HSs$6UH6+<VdL+<W'c+<VdT5UIg),pklB5UJ-8+=oc&-pU$_5V+$#+<VdL+<Vmo5VFZ85UIU,5X7S"5V+3+,sX^\5X6_?+<VdL.R66a5X6YI,pb/d/d`^D+<VdL+<W<[+<rNj,="LZ-6jol0-`_I5VF6+5X7R]5X7R_/g)8Z+=nj)5U\670.J(e,sX^F+<VdQ5X7S"5X6V<+<VdL+<W't5UIm//hSb&-8#WJ+<VdL+<VdL0/"tD5UJ$)+=JR%5U.g&+<W=&0-Deq-9sg]5U.U@5U@X$-n$B,-7U,k5X7S"5X6YK+<s-:5U.U@5X6YB,sX^\5X7R]/2&D$5VF>h+<VdL+<VdL,pb/j5U.C(-9sg],9SX)5X7R\-9sg]-8-to+<W3g-n$_u/0H&f0.&qL5X7S"5X7S"/1Mtp/h\M95U.a*5X7R_,:G/s/hS\%,:Yr3$6UH6+<VdL+@%5*-70if-9sg]-7U,\+<W<a5X7S"5X7S"5X7S"5X7S"-9sg@0.8,35X7S"5X7S"5UJ$)+=KK?5X7S"5X7S"5X6tR5X7S"5U.m..LI:@+<VdL+<W!X/0uSb/g`%j+<Vd[5X7R_/g)8f-pU$_5X6YL-nd5,0-_kf0.&qL5X7S"5X7S"5X7S"5U[`t/1*VI5X7S"5X6YI+=KK?-7UZ6-nboM+<VdL+<VdZ,q:-)-m10.5X7R_+=]WA5X7S"0-DA[+<W-[5X7S"5X7R]/hB77+=n`g+>,!+5X7S"5U.C(,:Xud0.\>55X7Ra+<VdV5X6YL.OHVP+<VdL+<VdL+>+uo/gEVH5X7S"5V+$#+=\^'5UA$6-9sgC-nHJ`+<W3`,sWb'5X7S"5X7S"5U\67/0H&g5X7S"5X7S"5UJ$)+<VdL+=09<5X6qS$6UH6+<VdL+@%D!/gWbJ5X7S"5X6_?+<VdL+<W9Z+<W't5X7S"5X7R_+<VdL+<VdZ.OZSi5X7S"5X7S"5X7S"-7CDf+>,<".R5:&+<W=&5U@O*0+&gE+<VdL+<VdL5Umm/-9sg]5X7R]/g)8Z+<VdL+<VdL+<W9i-9sg].P<&55X7S"5X6YI+=nul/1r%f+<W9f.OZVl/gWbJ,9S9t.Nfib5X6V</0bKE+<VdL+<VdL+<VdR/0HT25X7S"5Umm!+<VdL+<VdL+<VdL+<VdL+<W9]5X7S"5X7S".P<#45X7S"-nIVK5X7S"-6Oic-nZVb+<VdL/g`h0+=n`E+<VdL+<VdL+<VdL+<W<[.R66a5X6P:+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<Vsq-8$ho$6UH6+<VdL+<VdL+<VdT-m1,h5X7S".NfiV+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdO5UJ*7,75P9+<VdL+<VdL+<VdL+>+un+=nj)5X6kC+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL-pT+3/0bKE+<VdL+<VdL+<VdL+<VdL+<rK]/gWbJ.NgB05VF6&+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+>5u,/hACX+<VdL+<VdL+<VdL+<VdL+<VdL/h\=i,=!P-+=09"/1`"s+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<W=&5V+N@$6UH6+<VdL+<VdL+<VdL+<VdL+<VdV-m0WW5UA$*/g)Q-5X7S",qgel+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<Vd[5X6kQ.LI:@+<VdL+<VdL+<VdL+<VdL+<VdL+<W<j+<Vsq-7g8h5X7S"5X7S"-m0p',qgkn+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL,="LF+=IR>+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<r?Y/g`hK,;()e5X7S"-8$c55X7S"5X7R\/g)Vs/g)8Z+<VdL+<VdL+<VdL+<VdV/hSG"/g`hK/0HSQ+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL5Umm/,sX^\,qL/i0-Dl45X7S"5X7S"5V+N65X7S"5U@O*-9sg].Nfs$-8$nt5Un<7+=09<-8$Dj$6UH6+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL0-DAe-9sg]5U@s(+<W-^-9sg]5UJ*+,="LZ5X6eA,="LZ,p4U$5Umm-/g)8Z00hcf5Umm)$6UH6+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<Woo/g)bk5X7S"5X6YE/1r%f+<VdL+<VdL+<VdL+<VdL+<VdL/hAJ#,pklB5X7R]/hSOZ+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+=8Kh+<VdZ0-rkK5X7S"5X7S"5X7S"5X7S"5X7S"5X7S"5X7S"5X7S"-nZVj-jh(>+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL/0cet/g)8Z+<VdL/hS\+/1`>'/1`D+/hS7h+<VdL+<VdL/2&4T$6UH6+<VdL+C/8)/IDh-+<VdL+<Vdc"D2@cA2ad9Df0]7@V'R="`Rs[Chu$6?XIYgA1@QZz2*a)+Ap&!$FD5Z2.KBIas8W,V5r\m("D;du@O_?Xz:d?rD9QbAaE+h05D..O"2g\\GF`JTuF^ZD(DK]`7Df0E'DKI"3De3u4DJsV>F*2G@DfTqBCi<`m+E)9CCi<`mF*)G:DJ(LCFD,6+AS,k$AKZ8:FWb+5AKZ,5@:F%a+EVNEF`V+:9QbAaE+gV?+=BiZ87,+f?WBp'5tk9I;^W])@:O=r/iO#VATVNqDK[r>F+G/.z!!"q^EcYo.Aoos=?XInnF*)G:DJ+NC"%]Qns8W*Kz!!!9i2[+&,FCSuCE$014FEMVA+EM+9An>k'-t[U>@ruF'DC@+i/h%o`ATW'8DBL6H-n[,).3N2>A1SjEATVd#FCB9"@VfU(HQZN:-$(89+?^i"/hS8p/0K9^?XIMbA7^!.4WnBKFCo*%Fsnak/hSS%+FP[f+?'LGASbpfF>jJ4?Xn"l@psI<"$UEY2ZZK/"CcUoE]455Dfor>CjJ#FB4Z0sASuZM#%MRh@psI<"^bVIBm)E90fK/67Q1Z]?Z'G!Bl7HmGU`[nzTKtL??XIbjG;fqCATVd#FCB9"@VfU7"E%dqF>j7R5;rd\DKBB0F>jRg-m`CS.9ehB$=,Rrz!!!!@JJZ6363$ubs!e!K!,e<QfKk(jz!!!!X#%hdoD..N9z+q9;nJ_SI\)uos<s+.\dRr89+s8P"\@UX.b2ukl<;^qbIz0LIc&?XIYmCc;K+DJsVHz!!"]<2Zdtg2Z[_E!!&\%P9]!O2[3]3F(KB6JHGlPz!%IsK!!&\Ti'8alz!:[`Qz!;rHS2ZY-^#%qd]FCSuC#'+-rB4Z07z!;MU?JZ/_SVY1#p"pSHN"pRF1"pPD5+0H9c%7U=%#"ejq4kKN2RMuG88s1+t#"f(("r2_7"pR\B`W?WW^&l:Ug)U_K"pR]6!_*AS`WERM"uukl^&euk"pR\W'a=k7NWG.BL''m<!fd;A"!afO"pR]V!XA#n?'PZW!Y/T1"7?4#?]>*[!Y/Rs!WE-1?RCa6L'%F9!s[9^>quTg8gaK<p&Y6f!q$-X!`T@.joQ7Z!o47H!Y=]##42It.L$)L#6"Z.$\e`f-!^`K!X9#:#4;O,=U#(&h?!n]&mVmH#.=ULXol*7#!(ZJ"pR]u#IX`C"'`29XT>j4/rg%B!sUdV$jHo.NWZ]l]aI*>"(h`t`WM5'"uukl^&o(X",6ol"!b5VPm36N9j%Z)9'$6-"1A;=ecWVg[/h9G!nII^"(,dI#"l!#^&teG?TlC2[KBk_c3(KW?U4l#9%F)&#!(NB`WHE*jo_1W#!(6:"pQp8"#^?Dh?2%*#!(fJSc]0WecQ*\1kHeR#"mGK`WNUL*/t$N"1A;=ecX2"[/h6K"pR]N"#^?Dh?1Io#!(fJSc]0WecQ*\1m%eC#"f(("r0nQ!kn_)`WE.P"uH)f"pR[("pPei#*o?,#+bo$$C(ak!tJ[F#-J%DV?<ClXofoG"$QoLXol*5"uumr!sV5l"3MVg#*&e?",6nWL',s1L''&_"-*K6##@Pi#"m_Rp&a=W:Z__5"6BS[h?&]>XT;3`"pR]V!n@Lh!\V1gh?)g@53;ps#3Gt)5m@Ncp&^6VNWW7p!fd?e3P#Y(#"li>L'.DV?]G6V!<tQM",6j]3M$?H!X:Z^",6m^3@9ag"t9TX#"jmX`W69(Q32jD#!)>[Sc]I0!X8j$jT_RarW6FRNWTJ7U'q519"kBk#!'[*[K?^o#0m;T7KNbu9"kD]'a=l&".fPu3<f\J!uHP."pR]N!]C6Ch?(t(#!(37joQ$"ecH$[1b&\68d5df!]Cf8h?#\)!q$'n3<g8m!]De<#"iM4c2nd4!mUiO3<f]=!Z0AfecH=gh?**G#!#fj#"fXPmK,BI!q$'n3<gOZ"#^o9rW5%`h?(7r9NhW)9&9W$%L*c5'F"b6eH*qt%U[3X[KFeW,O,pH#"l$"mK!MPr<0P1%U[`g^&edO*ZhHc33E>J&I(%c%0d#/NWYjS"uuklNWU*7$3g],"s0oL4gkIL!X:Xh[K?^fdM<#k8d>7r\en-*!X8j$ecO\0^&g1+!o<t_3PGRB"RQO!dK'OV9(i>S!q$+h-B/*#!WXR,!r`6$-KY@6&giS>mK*CV!p0RH!`\:`m0VnV%tXfd#"m\RL'%omXTORc%UTG>!X9#:mK*S#-KPF)!W[3E#"f(("r5tr#42Ith#ZX>%UZ=>mK*l*o`Omh%UURE"o\Q'"pXc&'X\,D!Y/R<rW<'#7=bID#"n:b#42Ith?!nU!aNG@h?((j:Yl/4#MoM7^&m-m#!&[g"pR]6!_*AS`WERM"uukl^&f!k`W?WW`WFiq^&f>/%L*,0[KAu'3PGTu!sUai#.=UJ!X8j$V$=X9%UZpPT`__**LHm4#"jmVNWY"<7?.IX"uGfQ"pR\:c3"P`-FO!\'".nN"4[Y_3X,d\"pP8HV??5e#!&ggh>mg@[KD6b#!(3;^&njPD8lYf?WdR;8u2U'!tJ\g!QG3O?S3Cs"#pL^".0-`U(IS69&9X/"9o^3%L*,0NWYjS"uuklNWU*>"9o'&NWK+\p&[YerW:4F9Y^i:#"n"ZXUF7m&*<q<h?"_/"9o'&Xob0r"uuklXo]F8"U50'Q35J8"rR+<"pR[i#-J"C<sH)7(;0a_!Y/R5#0$]["pW?S+pQ<oJd4uT"U50'NWYRLnHKOS"pR\["%EJTQ32jD"uuklNWTuL#aPQ&?TA;p8s'2[#"n:b#0dQ^-3i$&3!KT4![S'%!X;*q"pR]>!eLLY#/1-CXUJLT!^6fK#0m8S$3CD99%F&]#!(NA[K6XnjoPbS!aTdM#"kHhL'%W?o`_2p%UZ@@ScT*V-C+`<.4PN+9(`@b!tJZBQ3.=!Q33-LjTZ]j"3(?G3Dftb8sTRf!X:XhQ3.=@Q33-JNWUMt"7?0o3Mln5!X:Zf"82d#3B@?K8d::X"q$(eNW[6**/4QU!KI7,p&^6TNWUMl"/Z,(3M$>-!sUcR!<ra#[KDft#!"$%!sU3I#mLT+#)35Q#u$0X"pR[(0)bo1"pY&.(Q&4t#"f(XrW4t^#6"Z?JHZ5^9&9X."9o_6!X8j$h?'8M"uuklh?"L<"pR]>!l50I#M9.`#"n"ZrW*3`mK1Z8"uukljoQ7I!U^"!?NLE99'ucM#Nc(._?'oG9&9WK!<sBl#mLT+#4;Pl$;?!T"pR[("pPgm!N#r/?Nq";"$H\i#"f)s!sV4!-Dgl.V?9!d3<BBh9!/8V!X:Xh[K?_'V??)m"pWW[7Ktm0!mUiO3<f]=!Yg=oh?"0oecO\0U&bha!<ra##0m:Y![u=qOpHaE"Gm9d#"n"Y`W??)joP;`SH:nt"pR]>!lb:J<*mQG#!)&PjoNI'><)ll8uN($#"g4*joPP!#6kB)"pP8H"t&1.2?r">M$$GW#R1K*`W?@P!F9CD#"mGJScT*V"pWW[([qY6#"f*.!kJM.fa7of9)\n[!<tQ="0MY/3K=48!X:Y+*rZ4##6"[s#u&GD"pR]M!O`"=?hFH6!=iI;^&bqK7HFQi!=iJ"!X8j$XTYL%jTRA%V?-Vs0bphl%UVd3#"k]qh>n*njoG[o!F=dimK!f)blReE%U\K%"pR\R!L<`r?WNHnQ2sGQ#+bi*?SVfi8lfP97AU$&%UW7SDFMeTFq.k[G'6:u"pR\#ScPD`70]Ui"puZR!K@.8\H)m=9(`=9%UW7cIRVKaL&hck<e^X0!C[3Q!<rn)!<ra#Xo^ck3OT!l!<tOg[K6X_#/1-C7]lgh!sStK#0m5Z?d/](!=iI;ecF>&7?IWU#"jRQL&qil#*&`h$9&0T!Z&NO#+bl3m0BKi%UXJc#"l92:5o?1bm7(8!\qq-:7VG@]a.Am"#9`V<XrJC#.4J;?"ORR\H2s>8e)%0,R058-7tbk2@a*e!^7*$[0&l.?Ns70$@)g[9"k@u!X:Xh#/1-TTaV,08gYkH!W\qq"pR[HjTkJ\!%*[,rW3)n!r`8p!^6Yi#"g5%!r`6$p&b3pp&[E)jTkbd!!_im"q)dV!qlZqp&aX`mK->h"pR[(#3Gt$joX'@joQ(]!XA#n?/>VedK*SW"pPh!!XA#n?'PHQ!Y/Sn!U^"!?_IK)#"n"ZR19EWnHK1%9"kD3#mLVG"pR[("pPh!!mUiO3<f]E!Z(nB#"m_R#.4J;joPap!aY3q#42It!X8j$h?!nl$='_83!KWQ!X8j$L*)]gh@Kjf+793-$;9e,Q34i2*8UqG#He+Y#!W"f2?jBb!Z0\p)$Uqp!<ra#"pXJs'IMoHp&Y6^!ql]`!^6emjoQ5DN<8ML!!3?/9'-3C!p0PN#3H!_!DH)i#"f(Hh?#S>h?)O8.)cAP!Y/Q="pR]e"7?4#?RE_tp&Y4@]aXlA!<*&n!ql[pOT>Xj8q@*L#"f*&".0-`J.2\e8tH+hSHE/p!s\,o?'YQs^^jZS"pPh!!X8i4#2TCc.L(V0%Tri;#"mGJL'%W?#)34,=ge?c!sUae"pR[(L'%VeXT?BLNWUDi!sZ.6?%E"\#"f(("r1I8!lt[SW"0(:9!/7#"uNIb`W??)[KEB/#!#ik#"f((V?7O8"3(BH3OT$U!sUc#"pR[(#*o?*ScauT#!&O_p&YFY"pUY$'W(tm!sUcg",6m^3EZOj9"kCn!sUcg!sSrdh?!nh!F=gh#.4M<mK*U[!aXXa#+u9-^&sr/#!&gg"pQoe"3(BH3OT$]!sUd""/Z/)3S=E;#"fsANWU&_"-*Hf3M$?8!X:Zq!<ra#V?<b!"p_sS"pR\s"0`"7#Oi0,#"ek$":5ML+Vbk8&XrFpRK<Zt8s05[#"f(P4uPk?#!)&P-;Ibtm/g<8-9_VH+pJ6DLB.Tk(+)c\.2LV@"uBEe#"f(X7Q(H7:,Z,_#!)&P-=0n/m/glH-3d4)"pROf#"D?G<Xo<o%]'D:!'g_m9!SU)#"h&d"uGfQ"pR[hZ3:Fg_>siF8raVB'@mU'"t!)'"pRg=5m@Nc%]'Cg!$31.3"FI>2?7b%#"f@0"saBW(,d3D"uu_h#"fB%#:9ET('Y-N(*5@\%L+p'V$AUQ"s*sV"s*su"s,*L/e/(GOT>Xj8gY_d1QhkF#"f(H:,W:\:)D=\"pR[P&-ar=!sSs%Fp8.-##9>"IRXN%JcQ&[8p1CC1^6]u2LZ\O3ALdC8d8%62L]NJ3JIQ@#!$i2"uLKu"uum2"u(c44pF#j"pQmg:3JOE4pF$%!Cd8RT`G?%8qm@)#!$i2"uHNZFuFeE#!%D=<X(R-"pQmg:3JOE<X(R=!G2NrFp8.-##9>"IV&dEL&l/r3HbT21t_m6#"l9((/A)A!?P9G[/i0l>65!59!n[`Am;YD7W)E7:3JOE('ZdR!?MG*aT;YN8fkbK"uGHD"pR[(-;HH'##5u]!<ra#"t!)'"pRg=OT>Xj8d6V;2?j@\(KgqH8iEpT"uAOL#"f(H4uNTL4r4b7#"f(H4uNTL4r:^2"pR["$=*g08W<a60f:tb!>##"!KmHf#"jaR"pR[(<X&pY<`V(Y<ZV8C"pR\#/hU7,Pm/R0r<HA(>65!58li%p<\>_"#!$u6#"f(8<]48"#!$9j#!!5!#"g3X#!'g,"pR[0"pQ?\!>Z/P"pQ,,!X8j$-5HeG"pQ+_%eU&R!$3JU!>%j-#"gde"rNL*"pR[H#42It"tgB62?rg\>lk378gXb2"'d/g##72`#"g3H(,$FM#!#Nb#"f(("r.=H#"]Rr[/h5&!<ra#(+'5GJH5rZ8e,tj!$3JU!Y?gc#"k`smM=(Y<&Org!aQ!o(+;WVm/gQO#13HV"r8OD/f"XO2?rOM>lk378j3IH!aR-""qiNmN<NTGPm/R0r<G5=>;iSa2D-=7#!%58"pR[07Qs9.!^9@`%Sfbf.L$)L<aI*R7UBCi%b1Sl!)?j4,?b9U9!n^a<a-&7<^fJa<^fbi(*cZ\#"f(("r.n+#!)/R"pR[0%42&r-L_$IciOCU8g^M<"rP,W"pR[""X+%,_#[C8WV-?*"pR[,"pR\[(rdEl'a4dG#%3Jm"qDCa"pRF)"pS-G"pR["!!Be*!GVfC8n%u/8hL;X,E`'3#"m/]hA<%%=V_3n!F-BEm/gPt*X4#>#42It-jBlJ"qDDG"pPQ7"pP8Z+pJ6DQN7:#('XsQ(BtWr;*bBj8e)&r#$hE;%RgR3"q!$g#"fXB"rIXN#"ejq$K:[ZEWu_?*X;!5>m:cc2D,aL3Aq*/!aRtoK`kZ_"pR[H-3b)0-B/7+%ONN%!X8j$"qE7D2AQKW4pLrk>tP;*8d5J02?jWq.L$(m2?jp$.L64_9'l[<2@VQ&##6f9!OVqI3X,d\7L"hX>p_0.&dAh(2Ehl\3CX3I>m<1k$X!Z<8f@m<8g^qH4urm3)GHS#"pR[HWWBL.)j14+#"h)%!<t>P"pR[(4pE\noaF#2[/rNU%6c[6;Z[.-8gaKE7N"Zb*`PTm5#Y#W#"gd;[/j&e[/iH/@Km$/[K2s(Sf1?VC"3V2YlP%58h(#L8iAl@!D`n`"u%Y6m/gQ7#.4J;T`G?%8iAm#!`)"f!BqCK!<ra##!N5F!!4/Y"i9m5dK'OV9$./=#"l`5"pR[(()Ae4()A=c!YuPU%Mffl((LO/"r7Cs"qD\4((MB1#.4RL!!^sU*WQrc*[;L+#"fX@*[:lc!u:k@%N[MD%NZi!/J\<j%N[MD%NZi!h#\>l"qD\4((MB1#/p]\!([:u8d5b0$3lau('"OK*]A6I#"ka3mM"F_-NF5PN<+_6$G?'5H3ORGEWu_?"pP8H"r8OD"pQCj"pP9'%\3ho!!Yms0^]:&%CQ?@->E`%&-`>2%a>&5!'USk6O!`I82^\>!aR,W3Euam%R1.="pu[]#"&S!*[N-;m/gPt"thf9"pR[@7Qs6N7S"(E"pR\&"pR["!tb]r!=#b$!BLDh8e)%X3!KR.3"?,s<sB-]2?kK4.L$A82@'Kk8d5J02?jp$$3g\U2BW2.9"#)h*l\7)0a7hS!!4%'!=6+,!?).H8eM=48e0AP-3+5s"u$es"sgSW*Y)Nu*Yq0G"pR[(*Y;!P"pR]V'BTG3$6L;n-6<ZI!A4@)"s-YH(+qKH"pR[X-3cI7/d<j:/f$k[/d=!0"/l5(aT2smpAr,8"pR]2"pP9(Z3CL;8d6mP$RR2Q,6f2A2Tc:0#"fpP%O22&"s*ac((MPn/KOm5((MPnN<UF(*Yo51#42R8!$2mc,PhQJ#"gcp#!"jo#!#."#!(ZG"pR\#-<=4Qh$76d-=1"\M?=%e8d:Oa*WR5s%O21s"!.F`((MPnK`W:q3!KRZ#2KM:!%'TV74ooF,6m632?5?f"uun,">0]N"9o'&"pSZRDC,QJFs[DRIO57Z*X6LA"pROV"pQtV#+Yu_!3-&(#"f(@/iGU/#!"jo#!'7!"pR[(2?jNnSHh=Y"tg)f-71>iZ2k.68mWhK3<ido.V:"33Gp/J3Oo.p#"f)r"!.F`((MPn[0.NN#1Wf&!$2n&,GtPH*Yu<f"pR[P"pQmg*\K?/*X4Vg-3cJ"-3cK@!<ra#-3cq!"pQtV#+Yu_!7CoQ#"f(@/iGU/#!""o-:LBN"uulG"q(X+#<i,)"pR[@((MPn]`T;U*Yo51#5nQD!$2mc,KKli#"f(8-8l&\"q!7("uul7"q(VV/iJLd"pR[p-3cJ2-3cJ:-3cKI!<ra#7OA="-72Ji#2KMb!2oo&#"fC1%Mf6a"ptRR"<IOI%OO(T(+(71h#\Vtf`;9]8d;*p*WR5s%O21C"<IOa((MS*!sSs%#1W`4!%o$F,6e>V8M12O1^5!R2DuT\3Bebo3?eY38nKCS3<f[o'P8Zr3Dp%c8g["S<$iqe;^P77.jcTD%`/5N#"gKP"uHN*/iGU/#!"jo#!&pi"pR[0#%fh!#"CQV"u]!VSHh=Y;$I4s2BE&_4sgIoG6UMP:*p0*<[J#2*X5(n"pQtV#+Yu_!%nH[2#%(U#"h?3#!#F*#!#^2#!'I$"pR[p<_cI\:.@DO2?jNnSHh=Y/d;M:p]:X(9&9sD'@$st!!EIb!?%R3$-2`?RK3Ts8s02Z#"lT2Se@V'?T'Mh<!F*r2Ehl\3LTsQ#"f(P"q*%9XU%],(,e(N!<ra#"r8gL2C8Vg4pIhi>rW#m8j3^h3CX4d#$hEk"q*=A/lW$-"u$5c%Q4M$(,d3<m/gQ?#+Ys(-8#cf=9\t%7L#+d>m<1k$T9oF!DbU+/lW#j2E#da#"h'##!#-W9jIr]"q*=IeHSed"pR\^!<ra#!!<B:'aCT0!<r`<56`/52[0I52BEnD1&qL_9"l(l(%rJ>!!*ZAdImT5"pR[d"pR[@2C;BM2?l19!<ra#(2C5X4K8Ge#"f@\[/iBN"pR\S(5<*\)*&H:"sb5om/gQ?#.4J;iW05f8hMFp3<h)?0J9a7%PB@p[/iB$"pR[03#3SG('ZcY"pR[02?l/_7Ktk4"pR[0/iGmO[/r6(*_*O=:H8U`8fg/C<$jd53>)N#8fh:C3C3oS8e*I;5!H@U4rG+o:-MF\!_sUS?F9i1%R((W(/>&o;$I4s%[[:)!B_b7#"gMU!Y-h@[/q*r2JFcaR/mKr8cShnVY1$#"pQ=W"qDOU"pRX!"pR\[&*=+o"s3gG(_4%L!>5S@8dYb,8cf2$8lc-#,R.QZ$FL"CAMN`["pR]m!FG^21%bZUSHpqS<G!hB$ta*YU':f+8hFA'"u-=Q"_K>u?BkR3o`nfW"#84*"pR]5#A.RTAmWF[*/t//eH@U\#[YIN0a:Wi/c>ibAm].Vh#SL'"pR]e!FEGG0a>#lAh@V$V$n?$!sSs%?!d1.0b%I.!\nOuXT^E`<G!h=!<ra#blh@l$S_j>$YCu&?M+@>#/(@U/S8<(*1[LEV$Jdl#%eX^"pP9(AmXj0*!TDT/[YptAm].Vo`H2!#[Wc(0r4nWbloi<!<ra#`<0Gk$8J@^?C_HYV#t&c$8ItN"pR]E#%$s00a>#oAh@V$r<++2#@<Z%0nfX7h$>`4"pR]u!FE/<0a?/5Ah@V$SHKqg!a_,o1!0P%#"iK6V$.jP"(&)71$o-Nh$,U!"CBme0a:Wi/KJG8?Y3WH!ZVEX"_K>u?KD2-kQ(kl8k!(R"u->$$"bc$?A/P&q?$p+9%=#Mm0bYn!aa[k0pMoKKa]]\"('LZ0a?G;Ah@V$`<I<9#@<At1#2q<SI.*J!a_u80tIDj#"f)3#"E32eH$Wom0mSYciOCU9$ITISI%"Tr<d-gAmW^_*!X@_Ah@V$V$\3B!X8j$AmU`'*;p(JjU<m:"^\;80nf[8oa!:S"(%f30p2PA#"i2+#$(qVAh@V$[0IZU2.eFP?F9kT#$#7eXU8ZP?Z?8S8nMCp#9:tp?H!7+#-A)A/S8>^$QRh$"pR\B?L7kM#/((M/S8>&!?;<7!G3q2!sSs%#$#7eh$I\*?Y3W(!?AKN?JPc>O9,Uj8d=A_Ah@V$h$P-.N<EQ$f`;9]9'$.]eI"%M"CC0r1#3(@N<M$r"pR\r"C@?#0r5(\KaBI<m0I;UAmXR%*7Y4!KaKQ5!sSs%#$#7ejU5[4?Y3X3"!"9B"pR\3?B#(-#42P*/S8>f"!!F("pR]>"JuF,$WR0,$bc67Z2k.68u_mr#"llBrX5kC%ouF03<iLg.L&o\9F:t.8d5J(8QJRj3<f[g(Dm>\9%<tY(1/C(#!":?m06iS#/(4H"ssN^Ig.M@T)f-S(2jC@('4[E8j<ML(9[`C:)4ZN#"f((#%.Z&":d$."V)#L#42O//Q`2]8cShs`V'<^"pR[D"pR[P#42Itl2_(n8hL=U!F=+S"pR[@"pQ=W*Z@_(!<ra#"tmIf9JQeV8f$dq-76,%-700K/gaO-/hTsQ-8&If"pR[2"pR[8m/f0m/iG=Gm/emm>I=Mb/e'-[-;Z>^![]NL"pR[8m/eU][/q[%%43D3.j"'Z/gb!2#"g3p/j9Il"u$66"u%YA"u@A+#"nS&ecrPg>6"X-XnDc6"pR[4"pR]n"!6k5>QP*68eqU8,R,:o$3o#_-3+Ms-6i_c#:9Ed*[W*Q*Y(UC*X4:u!<Nn)pAn.r#"hJl#"hpr!sTUZ!sSs%<X,r4?![`+"'oLCm/gQo"qY%:#3H8Y!sgfB"U5h/"pP9(%L2;%>m:KK2?jp$.NSf]!aQ9?ncE&#"pPgJ"U50'"r;YG#(?b+)?pC<"pT6/#'L2#aoM\N8p2h9,6f342?jqG2?F'e8d9_K.L$*3!B(DlL&j7<#'NOd"qFW;(5;iJ!X8j$#)3-_.L$*;!B(DlNWD*D#(@kA/q,#H"pR[2"pR[(%Xp;?(5;iJ#)3-_.L$ZK!B(DlNWD*D#(B+#!sSs%"r;YG#(?b+/q/7<Id-t=1V*Ym#"gcr"rMjk"pR[((3VS?Fp9E#G#:r3!<ra#"pP8H5m@Nc%a"hW)"I_4#"f)3"tBf]DDht/DE%h)?:\*L?6_uF#"f@0DE%h)?:\*L?6]Xa<]38K#"f((Ai:,'AiKu!<_*E)?8_ulAi9j*"tBf]DDl25#"f((?8`!o"tBf]Ai:,'AiKu!<_*E)?8_ulAiA<C"pR[(%TYIl#$s1l?3VmQ!<ra##(?b+#(F>g9I^5N8p2h9,6e?q2?n=/.L$Z;2F.NO8rs&X#"f(P"q!6m[/jPs#+Yj%7L&5]>rDmX>gNNV#"f(("r.=P%Q4M,(,c@4"tBf]*]=K4*]OW6#$2!m"tE(Hm/gQO#-\27"pP8H2?rOM>m:Ks2E:sG8cSu7'd4FsWqHH3"pR[4"pR\k"(pZr8HoA'8HoA/2@f*T('"OK"tUSq#"g!B#"ejsSH/m"_"IdI"pR[4"pR]F%^$B")F=K0#"f(0%Q4Lq%N5Ne%Q8>3#"gM%#;uQG#/(.F-3beV%L*+\"r7\,"u[5T"s*sU!X8j$-3gjY>qQ>@$!f.n"t9`d%Q4@m#"f@0#"o.A(,c@4*]=3L-8mJF/c[d6]`_Uf*X35](+(pD-8%2A"pR["#6K__F\-9NAHc6QHCP=0eN]^RM*]-lTKe4`]^VLTl9DO%Qc>kti]etYVINFj`]n]DOG6Vsb!1]TJ^U>#i]jQaHtn52"/fBeEBeRFW:0e-rO$l*?Rn=Y%VIJW^]FU`MS)L4ZNW-D'T;Rodh?6Q)^fKji46;Lh11lNSi76(AV[G]).4s,<BqC-!XOdl2[c4]7cTW+&,QKQW%%cIz!5LN%U(K4E(p6h8$+`A).KBGK!!!!c^c)OsFc_VZ<*DgO#X.L7j>\XMi\q@p#2%PDeOsUr5"?#4pGWZIG\Sj[.4h?$6Nd66!nn><z!!#[-.KBGK!!!!X^a]<az9#*B3!)2F1a^Z2W._)?eEbB+Ke!EVck!9)JHCK4Kag]2KI]GqT+iLkgdu9j7`88d9CM^:`R'34,6[5*JB^Ibe[4Jt*e2A984=,Ii2)lKH%:L$)5Sj/(UN72IP@1bnIZfcA&mLi;*6agI?[bYehoiFmZ)1*k4SUB+z!:[`Qz!!"Rc2[H%J!N&M[,8W9WmJ8Z'A^N0=*O;0U8Ft6]B1E>M\G\C.@<FL8m#31j=k8$5?7GpT!!!!a=hlKez!&hVO%#klo0o]j5PP3*[@k%HYz-GV)2zJ4@=5$o7*C4%d6CBU5Ro!\+0Mz.)7;4zJ4RI7$a<PR=umtg/=^Y4.KBGK!!!!`^a]<az1r)$ZJEM.g:%cc&W!G<DoI9h@!!!"L=26a&l9bh-p,ndOgEX$Sz!'jN!.KBGK!!#8a^a]<az#f%niz!)10Xz!5MaQ2Zi5,2\#TE#KP`fUBc4pjCm+'"UH%WgXJ.d!eukpQOYqjL@M<EdIbL6+::g`%STMr7FU8p4iRIOz!!#F&.KBGK!!!!E^a]<az'YlX9:1CKls+RhkXXi8U.KBGK!!!!1^c)F(mn<8-.KBGK!!!!t^a]<az:;A=Zz5Z#6T"ANKaGrGmpOBdVc2[Y[L";i+"KXA6u.KBGK!!!!=^a]<a!!!!a=269czJ6BZH"Ak1Hp,<4kj,C?l[1Okgz!$]3;(s2CeW-1c0"[>e3E+rbU!t&*!+Bk7*]IEm]!!!"L:r#!n_rp!ms#14^^S#g_D0>R@Vum1,p&Q'9#"fL4#"f4,#"k0`c4V0Y!X8j$"s*t:eH$`9"#1i$#%@0+*pj"`"s*sM#)rZo/J\QH"4dJW%L+Hg"pRXA"pR["!!TY$!?).H8eM=48e)%01^4-g8HK)#8d6UH7(iUJ`;q\?"pSN/![d:90a8s/!X?=?%d!d-#$"qM#5&((&-`>2+9i$BL)BUj[KTP/!">"a!U9[i#"mkU"pR]R!<ra#Xol*HecIf4"pR[(?3WLa!FC1/#$qKqXT;`S0a:qg6tK]\!ARmb#%@0+?A/D7#$qK8#1Wbb/LL`<('Y6Q/-aW+%P9=<()@+_#mMpbN<'M@#+c2,$EXCGFkHfW!uA9H0a8['8,WH0'epaF72uNV!Zip7jT-D)q?$p+8cf2$8d8T+7-+JVbl]\,"pSN'!F@W<#$qK8"pP9>#/(*K/J\Q0!aQiOh#]MF"pQmg]`S`rJcQ&[8d5b0/-aW+%P8J$()@)a"tUl$#"eq$#"i2+"q7U8?H!"$?3UUBh#Uhf0a:qg!mLa05$s!H54/GY"pQt"#+YcY/a<?@#"eq$#"i2+#%@H4?6q=4"pSM,"(%f+0a:qg!lbNN[/jPS#5&((%L*+o#1Wbb/Ir%$(?#8u#"f(@"q)IfN<:.)%L+Hg"pRX#"pR\+"pSM,!a`hJ0jY%g@?gq$Pl`ZE?3UI#/OfgX#"CQV#!PSL#!T^%#X1.)=>hdk"<<7!"pR[(blU?d7caY?"',U8>m<b&$]tGo#"eq$#"f)+#!93o?DR]X?3UUBeH9.N!\n!c#%<2e?DRZW#$qK8V@3\-!aQ#%#mLbY*?G:e/d=fMSH1W##0d35/O&7s4p+Oa4^A7U"q,q`"pR]h!<ra#!!!/+p&Pd1#"f4,#"f((#"\k##"f(@#"7h[*lS.7*X2gWK``C`"#1!$"p,!g!Y3ET('[K="qChg&-`>2^))M?jod+M"pR["!!T\%!Eo[38l>it8kK9l8jW^d8cf2$8d6UH7(iUJD)!@A#%@0+-LCjh"ssNU%L*,'"pP9'#/(*K/J\PU!F6`No`JJB"pR].%^lJB(Jb#2!rr<$]=],5));return 0XAfec,z;end;end;end;return nil,z;end,v=function(b,n,z)z[0Xb74]=(-74+((b.yk((b.Tk(z[8866],(z[0X7A_9f])))+z[7926],(z[0X7A9F])))+z[2525]));z[0x4043]=0X13+(b.yk((b.bk((b.Yk((b.Tk(z[0X568a],(z[31391]))),b.d[0x4],b.d[0B11])))),(z[0X7a9F])));n=-0X17B99a6+((b.ck(b.d[0X4]>=z[21601]and b.d[1]or z[29491],(z[23902])))-z[0x624c]+z[9509]);(z)[0x004029]=n;return n;end,Ub=function(b,n,z)z={nil,nil,nil,nil,nil,b.J,nil,b.J,b.J,b.J,b.J};n=0X32;return n,z;end,o=string.sub,yk=bit32.rshift,X=function(b,n,z,J)(J)[22]=(9007199254740992);J[0X17]=nil;if not n[31391]then n[1906]=-0xF4+((b.Yk((b.Ok(n[5184],b.d[6])),n[2525]))+n[0X1817]+n[0X9Dd]);z=-3942645729+(b.Tk((b.Ok(n[0X05D5e]+n[9509],b.d[0B100]))-z,(n[23902])));n[0X7a9f]=(z);else z=b:D(z,n);end;return z;end,l=function(b,n,z)z=(0X23+(b.Tk((b.yk((b.Vk(b.d[0b110]-b.d[1])),(6))),(0X1c))));(n)[7926]=(z);return z;end,Ik=bit32.bxor,ok=function(b)return{0b11010};end,_=function(b,b)return{b};end,zk=function(b,b,n,z,J)if b~=0X8__c then J=n[0X2][0X1f](z);return 6560,J;else n[0X2][0B1]=n[0x2][0X1f](z*3);return 6560,J;end;return nil,J;end,Zb=function(b,b)(b)[0B100011]=function()local n=({b[34],b});local z=n[0B1]();if z>=n[0X2][3]then return z-n[0X2][0B10110];end;return z;end;(b)[0B100100]=(function()local n=({b[0X22_],b});local z=n[0b1]();(n[0X2])[2]=n[0X2][0X2]+z;return n[2][0Xa](n[0x2][0B011001],n[0X2][0X2]-z,n[0B0010][2]-0X1);end);(b)[0X25]=(nil);b[0B100110]=(nil);(b)[0B00100111_]=(nil);end,jk=function(b,n,z)z=-0X14+(b.Qk((b.Ok(b.d[0X5]+b.d[0X1]+n[408],n[2932],n[5184]))));(n)[0X61__2E]=z;return z;end,Nk=function(b,n,z)z[0X6][0B111]=(b.E.bnot);n=0X48;return n;end,lk=function(b,b,n)return{b[0B100111](n,b[0B100000])};end,F=function(b,n)(n)[0X4]=b.Ik;end,u=string.char,Tb=function(b,b,n,z,J,g,K,O)if J==0XB6 then if not(z%(0x58 or 0B010101101))then else K,g[0X2][0X21]=J,(J);b=g[0x2][0x1d];end;end;(O)[n]=g[0X02][0x0013][z];return K,b;end,Uk=function(b)return{};end,wb=function(b,b)(b[2])[0X8]=19;end,V=function(b,b,n)(n)[0X5461]=b;end,tb=function(b,...)return{(...)()};end,W=function(b,b,n)n=b[16425];return n;end,pk=function(b,n,z,J)local g=(0B10_00__001);while true do if g==0X41 then if n~=0X3__7 then J=b:Zk(J,z);else J=z[0X05]();end;g=(0B10_1100);continue;else if g==0x2c then break;end;end;end;return J;end,Bk=function(b,n,z)local J;z=(nil);local g,K=7;while true do J,g,z,K=b:uk(n,z,g,K);if J==0X01302 then break;end;end;if not(K>0X37)then z=b:pk(K,n,z);else g=51;repeat if g>=118 then break;else g=0B111011__0;if n[2][0B100111]==n[2][0x16__]then(n[0B10])[0B100110]=(-(0Xe2>=150));if not(n[0x4])then else J=b:ok();return{b.L(J)},z;end;else if n[0X2][0X21]==n[2][0X8]then for J=0X035,0b10110000,0X18 do if J==0x35 then b:hk(n);continue;else if J==0X4d then return{},z;end;end;end;else if not(K<0B10000001)then z=n[2][0X1D]();else z=(n[0X3]()==0X1);end;end;end;end;until false;end;return nil,z;end,bk=bit32.bnot,Jb=function(b)end,T=function(b,b,n)n=(b[0X1817]);return n;end,qb=function(b,b,n,z,J)z=n[0X1][0xb](n[1][0x19],n[1][0X2],n[0B1][0B10]);J+=((z>0B111111__1 and z-0x80 or z)*b);return J,z;end,fb=function(b,n,z,J,g,K,O)local B;if g>0x63 then B,z=b:rb(J,K,n,z);if B==0Xe2__a3 then return g,K,0x6E9E,z;else if B~=nil then return g,K,{b.L(B)},z;end;end;else if not(g<102)then else g=0b1100_11_0;K=(J[0B10__][0B010011][O]);return g,K,0XF780,z;end;end;return g,K,nil,z;end,L=unpack,d={48589,3203742706,1626978855,2993460470,637236635,1570501412,2727151362,1478098121,1855697809},Kb=function(b,n)local z;if not((219-0X9e)/n[0B100])then else z=b:xb();return{b.L(z)};end;return nil;end,C=bit32.countrz,Bb=function(b,n,z,J)(J)[37]=b.m.yield;J[38]=function(...)local g={J};local J=g[1][5]('\35',...);if J~=0x0 then else return J,g[0X0__1][0X9];end;return J,{...};end;if not(not z[21850])then n=(z[0X555a__]);else n=(-2929439652+((b.bk((b.Kk(z[7926],(z[31391])))-z[0x7bE8]))+b.d[0B1001__]));z[0X555A]=n;end;return n;end,O=function(b,n,z,J)n[0Xd]=b.h;(n)[14]=function(g,K,O,B)B=({n});if K>O then return;end;local n=(O-K+0X1);if n>=0b10_00 then return g[K],g[K+0X1],g[K+2],g[K+0X03],g[K+4],g[K+0X5],g[K+0X006],g[K+7],B[0X1][0B1110](g,K+0B1000,O);elseif n>=0X7 then return g[K],g[K+0X1],g[K+0X2],g[K+3],g[K+4],g[K+0x5],g[K+6],B[0x1][0xE](g,K+0b111,O);elseif n>=0b110 then return g[K],g[K+0X1],g[K+0X2],g[K+0b11],g[K+0X4],g[K+5],B[0x1][0xE](g,K+6,O);elseif n>=0b00101 then return g[K],g[K+0x1],g[K+0X2],g[K+3],g[K+0X4],B[1][0Xe](g,K+0b101,O);elseif n>=4 then return g[K],g[K+0X1],g[K+0X2],g[K+3],B[0X1][0b1110](g,K+0X4,O);elseif n>=0x3 then return g[K],g[K+0b1],g[K+0x2],B[0x1][14](g,K+0x3,O);else if not(n>=2)then return g[K],B[1][0xE](g,K+0x001,O);else return g[K],g[K+0X1],B[0B1][0XE](g,K+0X2,O);end;end;end;if not J[0x5D5e]then z=(-0X1d+((b.Vk(J[2525]+J[22154]+b.d[7]))+J[0X624C]));(J)[0X5D5e]=z;else z=(J[0x5d5E]);end;return z;end,Ob=function(b,n,z,J,g,K,O,B,o,t,m,l,V,f,x,d,S,F,L)local e,P;o=(0x52);repeat if o<=9 then d,o=b:Fb(g,d,z,o);continue;else e,n,P,o,z=b:Pb(V,P,z,g,l,n,o);if e==46325 then continue;else if e==0X886e then break;end;end;end;until false;g=((V-P)/8);(t)[J]=(d);for V=50,135,0X2c do e=b:Ib(V,f,m,n,g,J,O,F);if e~=0XDA9 then else break;end;end;if P==0B101 then b:yb(l,g,J,x,B);elseif P==0x0 then F[J]=(g);else if P==0X2 then(F)[J]=(J+g);elseif P==0X1 then F[J]=(J-g);else if P~=0X7 then else f=(#l[2][0b1]);for V=123,212,0x028 do if V<163 then if S==0XCE then l[0B10][0X1][f+0b1]=(B);end;continue;else if V>123 then(l[0B10__][1])[f+0B1__0]=(J);break;end;end;end;l[2][1][f+0B11]=(g);end;end;end;if z==5 then if l[0b10][0X18]then g=(l[2][0b1__0011][d]);O=nil;m=(121);while true do if not(m<=4)then O=#g;m=0x4;else g[O+0X001]=x;break;end;end;(g)[O+0B10]=(J);(g)[O+3]=0x6;else x,L=b:Tb(L,J,d,S,l,x,K);end;elseif z==0B0 then t[J]=d;elseif z==0X2__ then b:bb(d,t,J);else if z==1 then(t)[J]=J-d;else if z~=0B111 then else b:Vb(J,d,l,K);end;end;end;return x,n,d,L,z,o;end,mb=function(b,n,z,J,g,K,O,B,o,t,m,l,V)while true do if t<0B11_01001 and t>0X34 then t,g=b:Ub(t,g);continue;elseif t<0x34 then t=b:kb(g,J,t);continue;elseif t>0X32 and t<0X5F then B=J[0B10][0x1F](K);o=J[0X2][0X1F](K);break;else if not(t>95)then else n,K,z,t=b:zb(z,J,t,K,n);end;end;end;O=J[2][31](K);l=J[0X2][0x1f](K);m=nil;V=(nil);return o,m,n,K,l,g,t,B,V,z,O;end,P=function(b,n,z,J,g)local K;(J)[4]=nil;z=0x0056;repeat n,K,z=b:j(n,J,z,g);if K==0xf__66A then continue;else if K==8055 then break;end;end;until false;J[5]=nil;J[0B0110]=(nil);z=(84);return z,n;end,r=function(b,n,z,J)local g;(n)[10]=nil;(n)[0Xb]=nil;(n)[0b1100]=(nil);J=108;repeat if J==108 then n[0X8]=({});if not z[2525]then(z)[0X198]=(-3087005098+(b.Yk((b.Ok(b.d[0X5]+b.d[0B10],z[0x7333],z[16793]))>J and b.d[2]or b.d[0B10__1],b.d[0X4],z[0x1EF6])));J=-4023311715+((b.Yk((b.Ik(b.d[3],b.d[0B00_110]))-z[0X7333]))+b.d[0X4]);z[2525]=(J);else J=b:Q(z,J);end;elseif J==0X5b then J=b:b(z,J,n);continue;else if J==0x7E then(n)[11]=b.xk;if not(not z[21601])then J=z[0x5461];else J=b:c(J,z);b:V(J,z);end;else if J~=0X45 then else(n)[0XC]=getfenv;break;end;end;end;until false;n[0Xd]=(nil);(n)[0xe]=(nil);n[15]=nil;J=(0B1__1000);repeat g,J=b:K(J,z,n);if g==0X9C22 then break;else if g~=0Xe60f then else continue;end;end;until false;return J;end,a=bit32.rrotate,rb=function(b,n,z,J,g)local K;g=#z;if J~=0x01F then else K=b:Kb(n);if K~=nil then return{b.L(K)},g;end;end;return 0Xe2a3,g;end,Hk=function(b,n,z,J,g,K,O)n=(6);repeat if n>0b110 then b:pb(J);break;else if n<45 then n=b:Bb(n,g,J);end;end;until false;(J)[0X28]=(function()local B,o,t,m,l,V,f,x,d=({J[0X22_],J,J[35],J[0X20]});l,d,x,V,t,m,f=b:sb(m,V,f,d,t,l,x);local S,F,L,e;x,L,l,m,F,t,d,f,e,V,S=b:mb(l,V,B,t,m,S,f,x,d,L,F,e);d=0X3B;while true do e,d,o,L=b:eb(f,e,B,L,d,F,m,t);if o==0X09__a59 then break;else if o==28258 then continue;else if o==nil then else return b.L(o);end;end;end;end;d=(89);while true do if d<0X73_ and d>89 then d=b:ab(d,L,S,t);continue;elseif d>100 then t[0B1001]=(x);t[11]=(l);break;else if not(d<0B1100100)then else t[0X4]=V;d=(0B1100100__);end;end;end;local P,w;d=(98);repeat if d<0B1011001__ and d>0B0011101 then d=b:Lb(d,B,w,P);continue;elseif d<0B0110_110 then return t;else if d>0b1100010 and d<0x73 then w=B[0B10][0X1f](P);d=115;continue;elseif d>100 then d=(0X36);t[3]=(w);continue;elseif d<0X64 and d>0X59 then d,o,t=b:Ab(F,m,t,L,S,V,d,e,B,f,l,x);if o==0Xf142 then continue;else if o==nil then else return b.L(o);end;end;else if not(d<0X6__2 and d>0b110110)then else d=(0B11001__00);P=B[0b001]();continue;end;end;end;until false;end);z=(nil);K=(nil);O=nil;n=(0b10__01111);while true do if n>89 then K=function(...)local B;B=b:tb(...);return b.L(B);end;if not g[0X599C__]then(g)[10315]=0x1D+(b.yk(g[8866]+g[0x1ef6]+g[31720]+g[0X3_93B],(g[2932])));n=(-3594405908+((b.Tk(b.d[0X7_]-b.d[0B101]+g[0X5461],(g[0X5D5e])))-g[0X09dD]));(g)[22940]=(n);else n=b:dk(g,n);end;elseif n<0B1100010 and n>79 then O=b:qk(O,z);break;else if not(n<0b1011001)then else z=(function()local B,o=({J[0b100010],J,J[0X1c],J[35],J[36],J[32],J[0X28]});o=b:ak(B);return b.L(o);end);if not g[9457]then n=(0b10100011+((b.Ok((b.Yk(g[0X5_d5e],g[0X546__1]))+g[14651],g[21850],g[0x624C]))-g[0X296D]));(g)[0X2_4F1]=(n);else n=g[9457];end;end;end;end;n=0B100100_0;return n,O,z,K;end,Rb=function(b,b)return{b};end,Tk=bit32.lrotate,mk=function(b,b,n,z,J,g)if not(J>0B11__111111)then for J=1,b do(g)[J]=z[0B111]();end;for b=0x1,#z[0B10][1],3 do z[0X2][0X1][b][z[0X2][1][b+1]]=g[z[2][0X1][b+0B10__]];end;elseif not(n)then else z[0B10][0X6][0X1]=(z[0B1__0][19]);z[0x2][6][0x4]=g;end;end,bb=function(b,b,n,z)n[z]=z+b;end,H=bit32.lshift,xb=function(b)return{};end,Vk=bit32.countrz,kb=function(b,b,n,z)b[0B1010]=n[0X1]();z=0B1101001;return z;end,ub=function(b,b)b=0B10__10101;return b;end,ob=function(b,n,z,J,g)g=(nil);local K=(0x4E);repeat if K>=0X55 then n,g=b:qb(J,z,g,n);b:Jb();break;else K=b:ub(K);end;until false;return g,n;end,pb=function(b,b)b[39]=(function(n,z,J)local g={b,b[0X1B]};local b,K=n[0B1010],n[0X7];local O,B,o,t,m,l=n[0x9],n[0B110],n[2],n[0X4],n[0X8__],n[0xB];J=nil;J=function(...)local V,f,x,d,S,F,L,e,P,w,j,Q,a=g[0X001][0B11111](b),0X1,1,(g[0X1__][0B1100_]()),0x0,(0x1);repeat local b=t[f];if b<0X31 then if not(b<0B11000)then if not(b>=0b100100)then if not(b>=0X1e)then if b>=0B110_11 then if not(b<28)then if b~=0B111_01 then(V[O[f]])[l[f]]=(V[m[f]]);else if V[K[f]]==V[m[f]]then f=(O[f]);end;end;else if V[m[f]]~=l[f]then f=O[f];end;end;else if b<25 then local W=false;L+=j;if not(j<=0X00__0)then W=L<=a;else W=(L>=a);end;if not(W)then else(V)[m[f]+0X3]=(L);f=(O[f]);end;elseif b==0X1a then local W=z[O[f]];(W[2])[W[0B01]]=(V[K[f]]);else V[K[f]]=(V[m[f]]/o[f]);end;end;else if b>=0X21 then if b>=0x22 then if b~=0B100011 then(V)[K[f]]=(V);else(V[O[f]])[V[m[f]]]=(V[K[f]]);end;else local W=(m[f]);(V[W])(g[0X1][0Xf](F,V,W+0B1_));F=W-0b1;end;else if b<0B11111 then local W=(z[O[f]]);V[K[f]]=W[0B10][W[0X1]][V[m[f]]];else if b==0B100000 then V[K[f]]=(o[f]%B[f]);else if not(not(V[m[f]]<V[K[f]]))then else f=(O[f]);end;end;end;end;end;else if not(b<0b101010)then if not(b>=0X2D_)then if not(b>=0B101011)then F=(O[f]);(V)[F]=V[F]();else if b==44 then local W=O[f];V[W](V[W+0X1__]);F=(W-0B1);else V[O[f]]=V[K[f]]/V[m[f]];end;end;else if b>=0X2f then if b==0x30__ then if not(P)then else for W,v in P do if W>=0X1 then v[0x2]=(v);v[0X3]=V[W];v[0X1]=(0x3);(P)[W]=nil;end;end;end;return V[O[f]];else V[m[f]]=not V[K[f]];end;else if b~=0x2e then(V)[K[f]]=(d[o[f]]);else V[m[f]]=(V[K[f]]%o[f]);end;end;end;else if b<0b100111 then if b>=0X25 then if b~=38 then local W,v=K[f],(m[f]);local y=(V[W]);(g[0B1][0X12])(V,W+0B1,F,v+0x1,y);else(V)[K[f]]=(V[m[f]]-o[f]);end;else local W=({...});for v=1,m[f]do V[v]=W[v];end;end;else if not(b>=0B1010__00)then(V)[K[f]]=n;else if b~=0B101001 then V[O[f]]=(#V[K[f]]);else local n=O[f];F=(n+m[f]-0X1);(V[n])(g[0B1][0Xf](F,V,n+1));F=n-0X1;end;end;end;end;end;else if not(b<12)then if not(b<18)then if b<21 then if not(b<0x13)then if b~=20 then local n,W=m[f],V[K[f]];(V)[n+0B1]=(W);(V)[n]=(W[o[f]]);else local n=(K[f]);V[n]=V[n](V[n+0X1]);F=(n);end;else local n=O[f];F=n+m[f]-1;V[n]=V[n](g[1][0XF](F,V,n+0X1));F=n;end;else if not(b>=22)then L=w[0X1];a=w[0X3];j=w[0x2];w=w[0x4];else if b==0X17 then F=K[f];(V[F])();F-=0X1;else local n=B[f];local W=n[0X3];local v=#W;local y=v>0B0 and{};local E=g[0B1][0X2_7](n,y);g[0X1][0X10](E,d);V[K[f]]=(E);if not(y)then else for d=0x1,v do E=W[d];n=E[0X2];local W=E[1];if n==0B0 then if not P then P=({});end;local v=P[W];if not v then v=({[1]=W,[0X2__]=V});(P)[W]=v;end;y[d-0X1__]=v;else if n~=0X1 then(y)[d-1]=(z[W]);else(y)[d-0X1]=V[W];end;end;end;end;end;end;end;else if not(b>=0B1__111)then if b<13 then V[m[f]]=(K);else if b==0XE then V[K[f]]=(V[m[f]]^V[O[f]]);else V[K[f]]=(B[f]^V[O[f]]);end;end;else if b<16 then(V)[m[f]]=o[f]+V[K[f]];else if b==0B1_0001 then(z[O[f]])[V[K[f]]]=(V[m[f]]);else if V[m[f]]~=V[O[f]]then f=K[f];end;end;end;end;end;else if not(b<0B110)then if not(b>=0b1001)then if not(b>=7)then w=({[0X3]=a,[2]=j,[0B1]=L,[0X4]=w});F=(m[f]);local n=g[0X2](function(...)(g[0x1][0B100101])();for d,W in...do(g[0x1][37])(true,d,W);end;end);(n)(V[F],V[F+0X1],V[F+0b10]);L=n;f=(O[f]);else if b==0B1000 then(V)[O[f]]=(l[f]..V[m[f]]);else local n=m[f];local d,W,v=L();if not(d)then else(V)[n+1]=W;V[n+0X02]=(v);f=(O[f]);end;end;end;else if b<0XA then if not(P)then else for n,d in P do if not(n>=0b1)then else d[2]=(d);(d)[0B11]=(V[n]);(d)[0b1]=(0X3_);P[n]=nil;end;end;end;return g[0b1][15](F,V,m[f]);else if b~=0b10_11 then(V)[O[f]]={};else local n=O[f];V[n]=V[n](V[n+1],V[n+0B010]);F=n;end;end;end;else if b<3 then if not(b>=1)then V[K[f]]=z[m[f]][o[f]];elseif b~=0x2 then V[O[f]]=(z[K[f]][V[m[f]]]);else local n,d,W,v,y,E,N,D=6,40;while true do if d<=0X028 then if d<=0b11010 then N=4503599627370495;d=-4294967246+(g[0b1][0X6][0B1__000]((g[0X1][0b110][0X7_]((g[1][0x6][0B1001]((g[1][0b110][0B10__01](d,(d))),(d))))),d));continue;else W=(0B1_0001__00);d=(0X3f+((g[0B01][0B110][0X8](b-b,b,b))+d-b));end;else if d==0X67 then D=(0);d=(-0X7FfFF_Fe6+(g[0X1][0B110][0b1010]((g[0X1][0x6][0xb](b-d-d)),(b))));else D*=N;N=(g[1][0X6__]);v=6;break;end;end;end;N=(N[v]);v=g[0B1][0B110];local u;d=0X1A;while true do if d==0X1A__ then v=v[n];d=(0B10111+(g[0b1][0X6][0X8]((g[0B01][0B110][0XA](b+b,(d)))==d and b or d)));elseif d==49 then n=(g[0X1][0X6]);d=133+((g[1][0X6][0Xc]((g[1][0x6][0X6](b<d and b or b)),(b)))-d);elseif d==0B101110__0 then E=(7);n=(n[E]);d=-4294967274+((g[0x1][0x6][0X6]((g[1][6][0XD]((g[0X1][6][7](b)),(b)))))-b);elseif d==11 then E=(g[0x1][0X6]);d=(0X6C+(g[0x1][0X6][0b1__001]((g[0X1][0X6][0XC](b+b>=b and b or d,(b))),(b))));continue;elseif d~=0x6e then else y=8;break;end;end;d=(27);while true do if d>32 and d<0B101__0_010 then y=(g[0X1][0B110]);d=-0X39+((g[0x1][0X6][0X9](d-b>d and b or b,(b)))+d);elseif d<0x20 and d>0B101 then E=(E[y]);d=35+((g[1][0B110_][0xE_](b>d and b or d,d,d))+d-d);continue;elseif d<0B111110 and d>0X1_b__ then y=y[u];d=(82+(g[0X1][0x6][0X9](d+d-b-d,(d))));elseif d<0b11011 then u=7;d=(-0X58+(g[0x1][0X6__][12]((g[0x1][0B110][0B1_111](b-b+b)),(b))));elseif not(d>0X3e)then else u=(t[f]);break;end;end;d=(0x056);while true do if not(d>0b111101)then u=t[f];y-=u;d=0b1111100+((b<=b and b or d)-b-b-b);else if d>0B101__0110 then E=E(y);break;else y=y(u);d=(0B11010_1_+(g[0X1][0X6][0B1101__]((g[0X1][0b110][0B1110](d-d+b)),(b))));end;end;end;y=t[f];d=0B101101;while true do if d<103 and d>0X2D then if n then n=t[f];end;break;elseif d>0x001__A and d<0B10110_1 then n=n(E);d=(-4294967152+(g[0x1][0b110][0x7__](d-b+d>=b and d or d)));continue;elseif d>0B00101000__ and d<0X31 then E-=y;d=(-0X9+((g[0X1][6][0b1000]((g[0B1][0b110][0Xe_](d,b,b))))+b+b));continue;elseif d>0x31 then E=(b);d=-4294967268+(g[0X1][0X06][0X8]((g[1][0X6][6]((g[0X1][0x6][0XD](d,(b))),b))-b,b));elseif d<0X28 then n=(n<=E);d=(22+(g[0X1][0X6][15]((g[0X1][0X6][0B1111]((g[1][0X6__][0B110](b+d)))))));end;end;d=(87);while true do if d<0X57 then E=t[f];break;elseif d>74 then if not(not n)then else n=(b);end;d=0X044+(g[0X1][0b110][0X8](((g[0B1][0X6][13](b,(b)))>d and d or b)+b,b,b));continue;end;end;y=(t[f]);d=19;while true do if d==19 then v=v(n,E,y);d=0x4c+(g[1][0X6][0X09](d+b+b+d,(b)));elseif d~=0x56 then else n=t[f];break;end;end;N=N(v,n);D+=N;W+=D;(t)[f]=W;d=90;while true do if d==0X5A then W=V;d=(84+(g[0X1][0X6][14]((g[0B1][0X6][0XF]((b<=d and b or d)+b)))));continue;elseif d==113 then D=O[f];N=nil;d=(-0B0011001000+(b-d+d+d+d));continue;elseif d~=0X1C then else(W)[D]=(N);break;end;end;end;else if not(b>=0b100)then local n,d,W,v,y,E=0X1,(0B1_0010);repeat if d<0X49 and d>18 then y=y[W];d=96+((g[0B1][0b110][0xb](d+b-d))~=d and b or b);continue;elseif d>0b1001001 then W=(V);break;elseif d<0X14 then v=m[f];y=(V);d=(-294836+(g[0X1][6][0B0110]((g[0X1][0X6][0Xa]((g[0B1][0x6][0XE](d)),(d)))-b)));else if d>0B10__100 and d<0b1_1_00_011 then W=K[f];d=15+((g[0x1][6][11]((d~=b and d or b)+b))+b);continue;end;end;until false;local N,D=v;d=21;while true do if d==0X15 then N+=n;n=(y);d=0X60+(g[0b1][0B110][0Xd]((g[1][0B110][0X7](d))+d+b,(b)));continue;elseif d==0X70 then W[N]=(n);d=-3221225460+(g[1][0x6][0xA]((g[0x1][0B110][8]((g[0X1][0X6][0Xc__](b,(b))),b,b))+b,(b)));else if d~=0B1111 then else W=(-4.294967274E9);break;end;end;end;d=107;while true do if d<=0B1001110 then n=(4503599627370495);break;else N=(0X0);d=(75+(g[1][0b110][0B1110]((d-b<b and b or b)==b and b or d,d,d)));end;end;local u;N*=n;d=(0B1000100);while true do if not(d<=0x38)then if not(d>68)then n=(g[0X1][6]);d=(0Xc+(g[0x1][0X6][9]((g[1][0X006][0B1110]((g[0x1][0X6][0XD](d+b,(b))),b)),(b))));continue;else if not(d>0X53)then E=8;d=-0X5C+((g[0X1][0X6][0Xf](d))+d+b+b);continue;else u=0XE_;E=(E[u]);d=-0b10001__01+(((g[0B1][6][0Xb](b))-b>b and d or b)<d and d or b);continue;end;end;else if d>0X016 then u=(t[f]);break;else n=(n[E]);E=g[0B1][0B110];d=(-1610612633+(g[0X1][0X6][0X8]((g[0b1][0X6][10](b,(b)))+b+b,d,d)));end;end;end;d=12;while true do if d<0X7b then D=b;d=(0B1__10__1111+(d-d+d-d==b and d or d));continue;else if not(d>0XC)then else u-=D;break;end;end;end;D=b;d=(52);repeat if d>0B11 then u-=D;d=(-0B10111_0+(((g[0X1][6][0B1000]((g[1][6][0X9](b,(b)))))>b and b or d)-b));continue;else if d<0X34 then E=E(u);break;end;end;until false;n=n(E);d=(0X32);repeat if d==50 then E=(b);d=0B10100_01+(g[0b1][0X6][0Xf]((b~=d and d or b)+d+d));continue;else if d==0X69__ then n+=E;d=(-0X9e+((g[1][6][14]((g[0B1][0X6][0b1011](d))+d,b,b))+d));continue;elseif d==0X34 then E=(b);d=-0XeD+(g[0B1][6][0Xc]((g[0X1][0b00110][0X0f_]((g[1][0X6][8]((g[0X1][0X6][0X9](b,(b))),b)))),(b)));elseif d==0X3 then n+=E;d=(-4294967289+((g[0X1][0X6][7](b+b))+b+d));continue;elseif d==0B110 then E=(b);d=(0x1e_+(d+d-b+b+b));continue;else if d~=0B1__011__01 then else n-=E;break;end;end;end;until false;d=(0X41);while true do if d<0X41 then n-=E;break;else if not(d>0X2C)then else E=t[f];d=(-0X1Dc+(g[1][6][0XC]((g[0X1][6][0X6](d,d))+b<d and d or d,(b))));end;end;end;N+=n;W+=N;t[f]=(W);d=0X4C;while true do if d==0X4c then W=V;d=(0x38+(g[0X1][0B110][14]((g[0x1][0X006][0XE]((g[0B1][0X6][0X7](b)),b,b))~=d and d or b,b,d)));elseif d==0X3B then N=v;d=(153+((g[0X1][6][0XE](b+b-b,b))-d));continue;else if d==0B1_011110 then n=y;break;end;end;end;E=(o[f]);d=0b1111011;while true do if d==123 then n=(n[E]);d=(0X1__B+((g[0X1][0X6][0b1101]((d<b and d or b)>=b and d or d,(b)))~=d and b or b));else if d~=0x1E then else W[N]=n;break;end;end;end;else if b==0X5 then local n=z[K[f]];V[m[f]]=n[0x2][n[0B1]];else if not(V[m[f]]<l[f])then f=O[f];end;end;end;end;end;end;end;else if not(b<0X49)then if b>=85 then if b>=91 then if b>=0X5E_ then if b<0X60 then if b==0B1011111 then(V)[O[f]]=(V[K[f]][B[f]]);else if not(o[f]<=V[m[f]])then f=K[f];end;end;else if b~=0X61 then Q,e=g[0X1][0X2_6](...);else(V)[m[f]]=m;end;end;else if not(b>=0X5c)then V[K[f]]=(V[O[f]]+B[f]);else if b~=93 then w=({[0X003]=a,[0X2_]=j,[0B1]=L,[0X4]=w});local n=m[f];j=(V[n+0X2]+0X0);a=V[n+0B1]+0x0;L=(V[n]-j);f=(K[f]);else(V)[m[f]]=(l[f]);end;end;end;else if b>=0B10110__00 then if not(b<0X59_)then if b~=0X005A then V[O[f]]=(g[0X1][6][K[f]]);else V[m[f]]=V[K[f]]>=V[O[f]];end;else V[K[f]]=(V[O[f]]..V[m[f]]);end;else if b<0B1010110__ then V[m[f]]=g[1][0X1F](K[f]);else if b==87 then if P then for n,d in P do if not(n>=1)then else(d)[0x2]=(d);d[0B11]=V[n];(d)[1]=3;(P)[n]=nil;end;end;end;local n=m[f];return V[n](g[0B1][15](F,V,n+0b1));else if P then for n,d in P do if not(n>=1)then else(d)[0B10]=d;d[0X3]=V[n];(d)[0X1]=0x3;P[n]=nil;end;end;end;local n=m[f];return V[n](V[n+0X1]);end;end;end;end;else if b>=0X4F then if not(b<82)then if not(b<83)then if b~=0X54 then(V)[K[f]]=V[O[f]]*V[m[f]];else(V)[O[f]]=(V[K[f]]+V[m[f]]);end;else local n=(z[O[f]]);(n[2][n[1]])[V[K[f]]]=(V[m[f]]);end;elseif b<0b1010000 then V[O[f]]=(V[m[f]]*l[f]);else if b~=0X051 then(V)[K[f]]=(V[m[f]]%V[O[f]]);else for n=O[f],K[f]do V[n]=(nil);end;end;end;else if not(b<0B100__1100)then if not(b<0X4D_)then if b~=0X4e then V[m[f]]=(o[f]*V[K[f]]);else V[m[f]]=-V[O[f]];end;else if not V[O[f]]then f=(K[f]);end;end;else if b>=0X4a then if b~=0X4__b then f=(m[f]);else if not(P)then else for n,d in P do if not(n>=1)then else d[2]=d;(d)[3]=V[n];(d)[0X1]=0x3;(P)[n]=nil;end;end;end;return V[m[f]]();end;else if not(P)then else for n,d in P do if not(n>=0x01)then else d[0x2]=d;(d)[3]=(V[n]);d[0X1__]=(3);(P)[n]=(nil);end;end;end;return;end;end;end;end;else if b>=61 then if b<67 then if not(b<0X4__0)then if b>=65 then if b~=0x42 then V[O[f]]=(O);else(V)[m[f]]=(V[K[f]]==V[O[f]]);end;else V[O[f]]=(g[0B1_][4](V[m[f]],l[f]));end;else if b<0X3e__ then(g[0B1][0X6])[O[f]]=(V[K[f]]);else if b==0B111111 then S=K[f];Q,e=g[0X1][0x26](...);for n=0X1,S do V[n]=e[n];end;x=(S+1);else V[K[f]]=(V[m[f]]-V[O[f]]);end;end;end;else if b<0B1__000110 then if not(b<0B1_000100)then if b~=69 then(V)[O[f]]=t;else(V)[O[f]]=(V[m[f]][V[K[f]]]);end;else local n,d,L=m[f],0b0,Q-S-0b001;if not(L<0B0)then else L=-1;end;for S=n,n+L do(V)[S]=(e[x+d]);d+=0B1;end;F=(n+L);end;else if not(b>=0B1000111)then V[O[f]]=(nil);else if b~=0B1001000 then local n,d,S,L,w,j=(0x63);repeat if n>0X63 then w=0B0;n=(-58+(((g[0B01][0X6][0XB](n))==b and n or b)+b>=n and b or n));continue;elseif n>13 and n<99 then L=(L[S]);break;else if n<0X66 and n>0X47 then d=(-0X3d);n=0X1F__+(b+n-n+n-n);elseif n<0XD then L=(g[0X1][0B110]);S=0X09;n=(46+(g[0b1][0B110][0B1111](n+n+n+b)));continue;else if not(n>0X8 and n<0B1000111)then else L=4503599627370495;w*=L;n=(0x8+((g[0X1][0X6][0B110](b-n,b,n))+n-n));continue;end;end;end;until false;local Q=(0XF);S=g[0X1][0X6];S=S[Q];local a;n=68;while true do if n==0X44 then Q=(g[1][0X6]);n=(0X12+(((g[0X1][0X6][0Xb](b))>=b and n or n)+n-b));continue;else if n~=0x53 then else a=8;break;end;end;end;Q=(Q[a]);n=(26);while true do if n<=0B11010 then a=b;n=-74+(b+n+n+n-n);else j=(t[f]);break;end;end;a=(a==j);if not(a)then else a=t[f];end;n=(0x6a);repeat if n<0x6A then j=(b);break;else if n>65 then if not a then a=t[f];end;n=-0X6+((g[0b1][0X6][0b1111](n))+b+b<b and b or b);end;end;until false;a+=j;n=(39);while true do if n<0x5a then Q=Q(a);a=t[f];n=(0B1000001+(g[0X1][0B110][0b11_11]((g[0B1][0B110][0X0b](b+b))+b)));elseif n>90 then S=S(Q);break;else if n<113 and n>0B100111 then Q-=a;n=(165+((g[1][6][0x0c](n,(0B11111)))-b-b+n));continue;end;end;end;Q=(0X1__9);n=(0x3e);repeat if n==0X3E then L=L(S,Q);n=-3758096379+(g[1][6][0XC](((g[1][0B0110][0b1001](n,(0X1)))==n and b or n)+n,(27)));continue;else S=t[f];break;end;until false;L-=S;S=t[f];n=0x7_3;while true do if n==0x73 then L=(L>S);n=-0X2F__FfffC__a+((g[0X1][0B110][0X6]((g[0X1][0X6][0B1100](n,(28)))))+b-b);continue;elseif n==54 then if L then L=t[f];end;n=-36+(g[0B1][0X6__][0xE]((g[0X1][6][0B110](b-b-b,n)),b,n));continue;elseif n==0X1D then if not L then L=(t[f]);end;w+=L;d+=w;n=(0X92+((g[0B1][0x6][6]((g[0B1][6][0X9](n,(n)))))-n-n));continue;elseif n==0b1011000 then(t)[f]=d;n=(-0x57FF62+(g[0X1][0X6][0b110]((g[0x001][0x6][0XE]((g[0B1][0X6][0B1010](n,(16)))))-b)));elseif n==87 then d=V;n=-0XD+(n+n-n+n-n);continue;elseif n==0X04A then w=O[f];n=(-0X6D+(((n+n==n and n or n)<=b and b or b)+b));else if n==0X021 then L={};(d)[w]=L;break;end;end;end;else local n=K[f];V[n]=V[n](g[0X1][0Xf](F,V,n+0B001));F=n;end;end;end;end;else if not(b<0X37)then if not(b<0B1110_10)then if not(b<0x3B)then if b~=60 then local n,d,S,L,w,j,Q=(0b1001__0_);while true do if not(n>=0x49)then Q=(-4.294967167E9);n=(-16310+(g[1][0X6][0x09_]((g[0x1][0X6__][7](O[f]))-O[f]+O[f],(n))));continue;else d=(0);j=4503599627370495;break;end;end;n=(90);repeat if n<0B111_0001_ and n>0B1001011 then d*=j;n=0X71+(g[0X1][0B11__0][0B110]((g[0B1][0b110][0Xa]((g[0X001][0X6][0B11_0]((g[0B1][6][10](b,O[f])))),O[f])),n));continue;elseif n<0X2E then w=(0X7_);n=47+((g[0x1][0X6][0X8]((g[0X1][0X0_6][0X6](O[f]+O[f])),n,n))>b and O[f]or n);elseif n>0X5A then j=g[0b1__][0X6];n=(0X11+((g[1][0x6][0B1010](O[f]+O[f]+n,O[f]))==b and n or O[f]));elseif n<0B1011__010 and n>0x2E then j=j[w];n=(0X84+((g[0X1][0B110][0xF](O[f]-b))-O[f]-n));continue;else if not(n<75 and n>28)then else w=g[0X1][0x6];S=(11);break;end;end;until false;local a;n=0X4e;while true do if n==0B1001110 then w=(w[S]);n=74+((g[0B1][0b110][0x8_](n+b-O[f],O[f],n))~=n and O[f]or b);else if n==0x55 then S=g[0b1][6];n=26+(((g[1][6][0xE__](O[f]+b))>O[f]and O[f]or b)+O[f]);else if n~=0X30 then else a=0x9;S=S[a];break;end;end;end;end;a=g[0x1][0b110];local W;n=(7);repeat if n>43 then if n>0B1_11010 then if not(n>0B10100_01)then L=t[f];n=(0X41+((g[0X1][0X6][10]((g[0X001][0B110][7]((g[0X1][0X6][11](b)))),O[f]))==O[f]and b or b));else W+=L;n=-0XbF59+((g[1][0B1__10][0B1101]((g[0X1][6][0B1111](n+n)),O[f]))-n);end;else W=b;n=0X16+((g[0B1][6][15](O[f]))+O[f]+O[f]==b and b or b);end;else if n<=0X07 then W=13;a=(a[W]);n=(-0X1c6+(g[1][0b110][0B1101]((O[f]+n<=n and O[f]or O[f])-n,(n))));continue;else if n~=0XE then L=t[f];W=W<L;n=0xe+(g[0b1][0B110][13]((n+n~=b and O[f]or O[f])-O[f],O[f]));else if not(W)then else W=t[f];end;break;end;end;end;until false;n=0B1110;repeat if n<0X70 and n>0XE then L=O[f];n=(0X42+((g[0B1][0B110][11]((g[0X1][0b110][0Xa](b-O[f],O[f]))))+n));else if n<0B0010101 then if not(not W)then else W=(b);end;n=(0x18+(((g[0X1][0X6][0xD](O[f],(n)))+O[f]~=n and O[f]or O[f])-n));else if n>0X15__ then a=a(W,L);break;end;end;end;until false;n=(0X3D);while true do if n==61 then W=(O[f]);n=(0X062+(((g[0X1][0b110][0xe]((g[0X1][0X6][0x6](n))))<=b and n or O[f])+O[f]));elseif n==120 then S=S(a,W);n=(-134217609+(g[0X1][6][12]((g[0X1][0B110][0XC]((g[0X1][0B110][15]((g[0X1][0x6][0XB](b)))),O[f])),O[f])));elseif n==0X77 then a=O[f];n=-0B1101+((O[f]<=n and n or n)+b+n==n and O[f]or n);else if n==0x6a then S-=a;n=0B1_0100_0_00+(((g[1][0X6][8](n>=b and n or O[f]))>=O[f]and O[f]or b)-n);continue;else if n==65 then w=w(S);break;end;end;end;end;n=(22);repeat if n>42 then if n<=0X3_7 then d+=j;Q+=d;n=0X61+((g[0B1][6][0b1011](O[f]+b<n and n or b))-n);continue;else if n==0x38 then j-=w;n=-54525897+(g[0x1][0X6_][0x06]((g[0B1][6][6]((g[0B1][6][0B1010]((g[0X1][0B11_0][0XF](n)),O[f]))))));continue;else w=t[f];n=-0B1100+(g[0X1_][0X6][0X6]((g[1][0b00110][0X07](n-b~=n and b or n)),n,n));end;end;else if n==0X2a then t[f]=(Q);Q=(V);break;else j=j(w);n=0b1__01100+(g[0X1][0B110][0xe]((g[1][0B110][9]((g[0x1][0X006][0Xd__](n,(n))),(n)))+b,n,n));end;end;until false;n=(88);repeat if n>0x57 then d=(O[f]);n=28+((O[f]+n<b and O[f]or n)+b-n);continue;else if n<88 then j=(O);(Q)[d]=(j);break;end;end;until false;else if not(l[f]<V[m[f]])then f=(O[f]);end;end;else V[K[f]]=V[m[f]]==o[f];end;else if not(b<0X38)then if b==0X39 then(V)[m[f]]=(V[O[f]]);else local n,o,t=K[f],m[f],(O[f]);if o~=0X0 then F=n+o-0X1_;end;local d,S;if o==0b1 then d,S=g[0b1][0X26](V[n]());else d,S=g[0B1][0X26](V[n](g[0X1][0Xf](F,V,n+0B1)));end;if t==0X1 then F=n-0x1;else if t==0X00 then d=d+n-1;F=(d);else d=n+t-0B10;F=d+0X1;end;o=0X000;for t=n,d do o+=0X1;V[t]=(S[o]);end;end;end;else(V)[O[f]]=e[x];end;end;else if not(b>=0X34)then if b<0b110010 then V[O[f]][B[f]]=l[f];else if b==0x33 then if not(V[m[f]])then else f=(O[f]);end;else if P then for n,B in P do if n>=1 then(B)[2]=B;(B)[3]=V[n];(B)[1]=0X003;(P)[n]=(nil);end;end;end;local n=(m[f]);return g[0X1][0Xf](n+O[f]-0X2,V,n);end;end;else if b>=0X35 then if b==0x36 then V[K[f]]=(z[O[f]]);else(V)[O[f]]=(g[1][4](V[K[f]],V[m[f]]));end;else local b=(m[f]);V[b](V[b+1],V[b+0b10]);F=b-1;end;end;end;end;end;end;f+=0B1;until false;end;return J;end);end,Qb=function(b,n,z,J,g,K,O)if n<=0X4__5 then z[K+0X1]=(g);return n,K,0Xc169,z;else if n~=0B1011011 then n,K=b:Yb(K,z,n);return n,K,39860,z;else z=O[0x2][0X00_13][J];n=(126);end;end;return n,K,nil,z;end,K=function(b,n,z,J)if n==24 then n=b:O(J,n,z);b:x();return 58895,n;else if n==0x17 then(J)[0Xf]=function(b,z,g)local K=({J,J[0b111]});g=(g or 0B1);b=b or#z;if not((b-g+1)>7997)then return K[2](z,g,b);else return K[1][0Xe](z,g,b);end;end;return 0x9c22,n;end;end;return nil,n;end,Cb=function(b,b,n)b=(n/0X4_);return b;end,b=function(b,n,z,J)J[9]=({});(J)[10]=b.o;if not n[6167]then z=b:y(z,n);else z=b:T(n,z);end;return z;end,sb=function(b,b,n,z,J,g,K,O)g=(nil);b=(nil);K=(nil);n=nil;z=(nil);O=nil;J=95;return K,J,O,n,g,b,z;end,hb=function(b,n,z,J,g)local K;while true do K,g,z=b:db(g,n,z,J);if K==0X0d1E3 then break;end;end;(n)[0X20]={};n[0x21]=function()local J,K,O,B=({n,n[0B11010],n[0X15]});for o=85,0b1010100__1,0B111_00 do if o<141 and o>0x55 then B=0X5;if J[0X1][0X16]==J[2]then while B do return-0x0054;end;end;elseif o<0X71 then K,O=J[0x3]('<\x64',J[1][25],J[0B1][0X2]);else if o>113 then(J[1])[0x2__]=(O);return K;end;end;end;end;(n)[0X22]=function()local J,K,O,B={n},0B1_01000;while true do if K<40 then return O;else if K>0X28 then B=0b1;K=0x1A;repeat local n;n,O=b:ob(O,J,B,n);B*=0B010000000;J[1][0x2]=(J[0x1][0X2]+0X1);until n<0X80;continue;else if K>0B11010 and K<0B110__011__1 then O=(0B0);K=0x6__7;end;end;end;end;end;return z,g;end,lb=function(b,b,n,z,J,g)b[J]=z;(g)[J]=(n);end,ik=function(b,n,z)if z<0B1001 then(n[6])[0b1110__]=(b.E.bxor);z=0X2__0;return 0xF99A__,z;elseif z<32 and z>0B1_01__ then(n[6])[0XC]=b.H;return 0Xfc31,z;elseif z<82 and z>32 then z=b:Ck(n,z);else if z>0B111_11_0 then n[0B1__10][0xA]=b.a;z=(0X9);return 63898,z;else if not(z<0X3e and z>0X9)then else(n[0x6])[0B1001]=b.e;z=82;return 0xf99A,z;end;end;end;return nil,z;end,I=function(b,n,z,J)if z==84 then n[0B101]=(select);if not(not J[7926])then z=(J[0X1EF6]);else z=b:l(J,z);end;else if z==0B100011 then n[0X06]=({});return 0X9ee0,z;end;end;return nil,z;end,Yk=bit32.bor,Db=function(b,b,n)b[n+3]=0x2;end,Mb=function(b,n,z,J,g,K,O)local B;z=(nil);g=(nil);O=0X63;repeat O,z,B,g=b:fb(n,g,J,O,z,K);if B==0xF780 then continue;elseif B==0x6E9e then break;else if B==nil then else return O,{b.L(B)},g,z;end;end;until false;return O,nil,g,z;end,N=function(b,n,z,J)J=({});(z)[1]=b.J;z[0b1__0]=0X1;n=nil;(z)[0X3]=(nil);return n,J;end,kk=function(b,n)local z;repeat z=b:Uk();return{b.L(z)};until false;while n[1]do n[0B10][0b10110]=(0xa0/200<=n[0X2][0x1E]);return{};end;return nil;end,ib=function(b,n,z,J)local g;for K=14,110,0X60 do if K==110 then if not(n[2][0B1__0111][g])then local K,O;for B=0B011110,225,0x3d do if B>0X5b then if not(B>152)then n[0X2][0B0010111][g]=(O);continue;else b:Hb(O,J,z);break;end;else if not(B<=30)then O=({[0X2]=g%0X4,[1]=K-K%1});continue;else K=b:Cb(K,g);continue;end;end;end;else(z)[J]=n[0X2][0X0_017][g];end;else g=n[0X1]();continue;end;end;end,Jk=function(b,b,n)(b[0B10])[0B011000]=(n);end,Eb=function(b,b,n)b=(0XCE);n=64;return b,n;end,sk=function(b)end,Lb=function(b,n,z,J,g)for K=0B1,g do b:ib(z,J,K);end;n=(0x1D_);return n;end,db=function(b,n,z,J,g)if not(n>0B1000011)then J=function()local K={z[0X15],z};local O,B=K[0X1_](b.k,K[0x2__][0b11001],K[2][0B10]);(K[0X2])[2]=B;return O;end;z[29]=(function()local K,O=({z[0B10101],z});local B,o=K[0X1]("\<\x69\u{0038}",K[2][0x19],K[0B10][2]);if K[0B10__][0xE]~=K[0x2][0B1001]then else return K[2][0X6];end;local t=0x31;while true do O,t=b:t(B,o,K,t);if O~=nil then return b.L(O);end;end;end);if not g[10605]then g[31720]=-0X6__e9Bb350+((b.d[0B11]~=n and b.d[0x6]or g[8866])-b.d[0B111]+b.d[6]==g[16451]and g[0X546__1]or b.d[0x9]);n=-0X1FfFfbA+(b.Kk((b.Vk(b.d[0x6]))+g[29491]+n,(g[0XB74])));(g)[10605]=(n);else n=g[10605];end;else if n>=109 then z[0B11111]=b.z;return 0Xd1e3,n,J;else z[0X1e]=function(...)return(...)[...];end;if not(not g[0X2__e27])then n=b:A(n,g);else n=0b1101101+(b.Qk((b.bk(g[0X393B]+g[0X6__8c6]+g[0X7_7__2]))));(g)[11815]=n;end;end;end;return nil,n,J;end,Xb=function(b,b,n,z,J)(n)[J+2]=(z);b=(0X4E);return b;end,yb=function(b,n,z,J,g,K)local O;if not(n[0X2][0X18])then(K)[J]=(n[0B10][19][z]);else local K,B,o=91;while true do K,o,O,B=b:Qb(K,B,z,g,o,n);if O==0X009Bb4 then continue;else if O==0xc169 then break;end;end;end;(B)[o+0b1_0]=(J);(B)[o+0X3]=(0Xb);end;end,U=coroutine.wrap,n=function(b,b)(b[0X1])[0X2]=b[0X1][0X2]+0X1;end,Rk=function(b,b,n,z)n=(z[b[0B1]()]);return n;end,p=table.move,Q=function(b,b,n)n=b[0X9dd];return n;end,Gb=function(b,n,z,J,g,K,O,B,o)local t;if K==0b101 then t=b:Wb(g,z,o,O,n,J);if t==nil then else return{b.L(t)};end;elseif K==0X0 then(B)[n]=(o);elseif K==2 then B[n]=(n+o);elseif K==0x1 then b:Sb(o,B,n);else if K~=7 then else local z,J;for K=0B110010,368,0X0042 do if K==0b110010 then z=#g[0X2][0B1];continue;else if K==0XB6 then t=b:_b(g,J);if t==62522 then continue;else if t~=nil then return{b.L(t)};end;end;elseif K==248 then(g[2][0X1__])[z+1]=(O);else if K==0B11101__00__ then J=b:nb(J);else if K==0X13a then b:gb(n,g,o,z);break;end;end;end;end;end;end;end;return nil;end,eb=function(b,n,z,J,g,K,O,B,o)local t;if K>0X40 then K=(0x25);if J[0X2][3]==J[0X2][0X1__D]then return z,K,{J[2][0X16]},g;end;return z,K,28258,g;else if K<94 and K>0X3B then K=(0X1f);if z==206 then else t=b:Rb(z);return z,K,{b.L(t)},g;end;o[0x8]=n;elseif K<59 and K>0X1f then z,K=b:Eb(z,K);return z,K,0x6__E62,g;else if K<37 then o[0X7]=(O);return z,K,0X9a59,g;else if not(K<64 and K>0B100101)then else K=0x5e;g=J[2][0B0011111](B);return z,K,28258,g;end;end;end;end;return z,K,nil,g;end,A=function(b,b,n)b=n[11815];return b;end,qk=function(b,b,n)b=n();return b;end,ab=function(b,b,n,z,J)J[0x6]=z;b=0x73;J[0B10]=(n);return b;end,J=nil,Yb=function(b,b,n,z)z=0B1000101;b=#n;return z,b;end,Ek=function(b,n)(n[0X2])[0X0017]=b.J;end,c=function(b,n,z)(z)[0X624c]=(-1478098074+((b.Qk((b.Ok(z[0X1Ef6]))+z[16793]))<z[0x56_8A_]and b.d[0x8_]or b.d[0x8]));z[14651]=(-5059391990+(z[29491]-b.d[0B1]+b.d[0x2]+b.d[9]+z[22154]));n=-2727102788+((b.d[0B1000]-b.d[2]>b.d[0X9]and z[15908]or z[0X4199])-b.d[0b1]+b.d[0B11_1]);return n;end,Qk=bit32.countlz,ek=function(b,n,z,J,g)if J>0X004D and J<119 then z[0x2][0B10011]=b.J;else if J<0X62 then g=b:Rk(z,g,n);else if J<140 and J>0X62 then(z[0b10])[0B1]=b.J;else if J>0X77 then b:Ek(z);return 19381,g;end;end;end;end;return nil,g;end,Ab=function(b,n,z,J,g,K,O,B,o,t,m,l,V)local f;B=(89);for x=0B1,z,0X1 do local z,d,S,F,L,e,P,w;S,w,z,e,F,d,L,P=b:Nb(P,w,e,t,S,L,F,z,d);J,e,w,F,P,S=b:Ob(e,P,x,z,K,O,l,S,m,L,t,d,V,J,w,o,n,F);f=b:Gb(x,J,o,t,F,g,V,L);if f~=nil then return S,{b.L(f)},J;end;end;J[0X5]=t[1]();return B,61762,J;end,Fk=function(b,n,z,J,g,K)local O,B=0x3e;repeat B,O=b:ik(z,O);if B==64561 then break;else if B==0xF99A then continue;end;end;until false;for o=33,163,0X14 do B=b:Lk(z,o);if B==0X5097 then break;end;end;O=0b1001101;repeat if O<77 and O>0B111 then O=(7);z[0X6][13]=b.i;continue;elseif O>72 then O=b:Nk(O,z);continue;else if not(O<0X48)then else K=z[0B100111](K,z[32])(J,b.q,z[0B1111__0__],n,z[0b100001],z[0B11100],g,b.d,z[0X1a],z[0X27]);break;end;end;until false;return K;end,zb=function(b,b,n,z,J,g)J=n[1]()-31521;g=n[0X2][0X1F](J);z=(52);b=n[2][0X1F](J);return g,J,b,z;end,ak=function(b,n)local z,J;for g=0x77,0X149,0B1101001 do if g==0B11100__000_ then J=n[1]()-88471;continue;else if g==329 then(n[2])[19]=n[0B10][31](J);else if g==0X77 then(n[0X2])[0B10111]={};continue;end;end;end;end;local g,K=0X6A;repeat if g<=0x41 then b:Jk(n,K);break;else g=(0B1000001);K=n[0B1_1]()~=0X0;end;until false;for O=1,J,0B1 do g=nil;z,g=b:Bk(n,g);if z==nil then else return{b.L(z)};end;for B=0B1110100_,0Xa6,0X32 do if B==0X74 then b:sk();continue;else if B==0xa6 then if not(K)then(n[0X2][0B10011])[O]=(g);else if n[6]==n[0b101]then z=b:kk(n);if z==nil then else return{b.L(z)};end;end;n[0X2][0X13][O]=({[0x0]=g});end;end;end;end;end;g=n[0X1__]()-0xD46a;J=nil;for O=0B11001,370,0B1110011 do if O<=0x8C then z,J=b:zk(O,n,g,J);if z~=0X19__a0 then else continue;end;else b:mk(g,K,n,O,J);end;end;g=(nil);for K=0X4D,0XBd,21 do z,g=b:ek(J,n,K,g);if z==0X4b_b5 then break;end;end;return{g};end,y=function(b,n,z)(z)[0X568a]=0b1_0010_110+((b.Vk((b.Qk(z[0x9d__D]))+b.d[0B1__001]))-z[16793]);n=-47710208+((b.Ik((b.Yk((b.Tk(n,(19))))),z[0x09dD]))+z[0X1Ef6]);z[0X1817]=n;return n;end,E=bit32,Sb=function(b,b,n,z)(n)[z]=z-b;end,Wb=function(b,n,z,J,g,K,O)local B;if not(n[2][0B11000])then(g)[K]=n[0X2__][0X13][J];else local g,o,t;t,B,o,g=b:Mb(O,g,n,o,J,t);if B==nil then else return{b.L(B)};end;g[o+1]=z;t=(0X6b);while true do B,t=b:vb(g,t,o,K);if B==0x233b then continue;else if B==0X744c then break;end;end;end;end;return nil;end,Kk=bit32.lshift,Hb=function(b,b,n,z)z[n]=b;end,q=function(...)(...)[...]=nil;end,ck=bit32.rrotate,B=string.gsub,hk=function(b,b)(b[0X2])[0X27]=b[2][6];end,k="<I4",Ib=function(b,n,z,J,g,K,O,B,o)if n==0B10111_10 then b:lb(z,K,J,O,o);return 3497;else if n==50 then B[O]=g;end;end;return nil;end,Pk=function(b,n,z,J,g,K,O,B)if O[0x1e]==O[0X9]then else g=b:Fk(z,O,B,n,g);end;if not K[24878]then J=b:jk(K,J);else J=K[0X612E];end;return J,g;end,rk=(function(b)local n,z,J,g=({});g,J=b:N(g,n,J);local K;K,g=b:P(g,K,n,J);K=b:Y(n,K,J);K=b:r(n,J,K);K=b:M(J,K,n);K=b:g(K,g,J,n);g=(nil);K,g=b:G(n,g,K);g,K=b:hb(n,g,J,K);b:Zb(n);local O,B,o;K,o,O,B=b:Hk(K,O,n,J,B,o);while true do if K==0B1001000 then K,o=b:Pk(g,B,K,o,J,n,O);continue;else if K~=0B111 then else z=b:lk(n,o);return b.L(z);end;end;end;end),h=setmetatable,uk=function(b,b,n,z,J)if z>0b111__ then J=b[0X3]();return 4866,z,n,J;else n=(nil);z=(0X3a);end;return nil,z,n,J;end,nb=function(b,b)b=(0X59);return b;end,x=function(b)end,z=table.create,Fb=function(b,b,n,z,J)n=(b-z)/0x8;J=84;return n,J;end,D=function(b,b,n)b=n[31391];return b;end,i=bit32.lrotate,Z=string,Vb=function(b,n,z,J,g)local K,O=(0X41__);while true do if K==0X41 then K=(0B101100);O=(#J[2][0B001]);continue;else if K==0X2c then K=b:cb(K,g,O,J);continue;else if K==0B11011 then(J[0X2][0B1])[O+0x2]=n;break;end;end;end;end;J[0B10][0B1][O+0b11]=(z);end,j=function(b,n,z,J,g)if J>0X3d then if J>=0X78_ then b:F(z);return n,8055,J;else n=b.u;if not g[8866]then g[0X419__9]=-0x5D9bf2D1+(b.Yk((b.Qk(b.d[0X5]>=J and b.d[0X3]or b.d[0b10]))+b.d[0X6]));J=-14553+(b.yk((b.Tk((b.bk(b.d[0b100_1__]))+b.d[0X1__],(0X1D_))),(0X11)));g[0X22A2]=J;else J=(g[0X22A_2]);end;end;else z[0x3]=4503599627370496;if not(not g[0X3E24])then J=g[0X3E__24];else g[29491]=(-4187707015+((b.ck(g[8866]+b.d[0X8],(14)))-b.d[8]+b.d[6]));J=(-0x3e1d8AF6+(b.Ik((b.d[0X4]~=b.d[0X3]and g[8866]or b.d[6])-b.d[0B1__01]+b.d[4],b.d[0X4])));(g)[0X3_E24]=J;end;return n,63082,J;end;return n,nil,J;end,Nb=function(b,b,n,z,J,g,K,O,B,o)B=(nil);local t;o=nil;g=(0X2);repeat if g==2 then B=J[0B11]();g=(121);continue;else if g==121 then t=J[0X03]();g=0X4;continue;else if g~=0B100 then else o=J[3]();break;end;end;end;until false;O=t%0X08;K=(t-O)/0B001000;z=(nil);b=(nil);n=nil;return g,n,B,z,O,o,K,b;end,Lk=function(b,n,z)if not(z<=0X21)then if not(z<73)then(n[0X6])[0B100__0]=b.E.bor;return 0X5097;else(n[0B110])[0XF]=b.E.countlz;end;else n[0x006][11]=b.C;end;return nil;end,t=function(b,b,n,z,J)if J>0X0031 then return{b},J;else if J<0b1011100 then(z[2])[2]=(n);J=0X5c;end;end;return nil,J;end,jb=function(b,b,n,z,J,g)z=0X9;b=g[0X3]();J=(n%0b1000);return b,J,z;end,Ck=function(b,n,z)z=(5);n[0b110][0B110]=b.R;return z;end,g=function(b,n,z,J,g)local K;g[0B1011_0]=(nil);(g)[0x17]=(nil);g[0B11000]=nil;g[0X19]=nil;n=(0X7b);while true do K,n=b:S(J,n,z,g);if K~=45036 then else break;end;end;g[0b1_1_010]=(function(z)local J={g};for K=0b11101,40,0X00b do if K<0X28 then if J[0B1][0B1001]==J[0x1][0B1110]then else b:w(J,z);end;continue;else if K>0X1D then(J[1])[2]=0x1;end;end;end;end);(g)[0b1101__1]=b.U;(g)[0X1C_]=function()local z,J=({g});local g=z[0B1][0XB](z[1][25],z[0X1][0B10],z[0X1][0X2]);for K=0X4a,0xD3,0X74_ do if K==0B1011111_0 then J=b:_(g);return b.L(J);else if K~=0X4a then else b:n(z);continue;end;end;end;end;return n;end}):rk()(...);
