

-- [[ 扩展全局变量table的方法 ]]

-- 打印table的内容
-- @function: 打印table的内容，递归
-- @param: tbl 要打印的table
-- @param: level 递归的层数，默认不用传值进来
-- @param: filteDefault 是否过滤打印构造函数，默认为是
-- @return: return
local function PrintTable( tbl , level, filteDefault)
    local msg = ""
    filteDefault = filteDefault or true --默认过滤关键字（DeleteMe, _class_type）
    level = level or 1
    local indent_str = ""
    for i = 1, level do
        indent_str = indent_str.."  "
    end

    print(indent_str .. "{")
    for k,v in pairs(tbl) do
        if filteDefault then
            if k ~= "_class_type" and k ~= "DeleteMe" then
                local item_str = string.format("%s%s = %s", indent_str .. " ",tostring(k), tostring(v))
                print(item_str)
                if type(v) == "table" then
                    PrintTable(v, level + 1)
                end
            end
        else
            local item_str = string.format("%s%s = %s", indent_str .. " ",tostring(k), tostring(v))
            print(item_str)
            if type(v) == "table" then
                PrintTable(v, level + 1)
            end
        end
    end
    print(indent_str .. "}")
end

-- 更新newtlb的内容到tbl
local update = function (tbl, newtblb)
    for k,v in pairs(newtblb) do
        tbl[k] = v
    end
end

table.PrintTable = PrintTable
table.update = update
