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
return aa;
