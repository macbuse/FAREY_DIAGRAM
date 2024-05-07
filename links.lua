-- require	"luarocks.loader"

local http = require("http")
local htmlparser = require("htmlparser")

-- Function to extract links from a web page
local function extract_links(url)
    local response, err = http.request("GET", url)

    if not response then
        print("Error fetching page:", err)
        return {}
    end

    if response.status_code ~= 200 then
        print("Error: HTTP status code", response.status_code)
        return {}
    end

    local links = {}

    local handler = htmlparser.DefaultHandler()
    local parser = htmlparser.Parser(handler)

    parser:parse(response.body)

    for _, node in ipairs(handler.dom) do
        if node.name == "a" and node.attributes.href then
            table.insert(links, node.attributes.href)
        end
    end

    return links
end

-- Check if a URL is provided as a command-line argument
if #arg ~= 1 then
    print("Usage: lua script.lua <URL>")
    return
end

local url = arg[1]
local links = extract_links(url)

print("Links found in", url)
for i, link in ipairs(links) do
    print(i, link)
end

