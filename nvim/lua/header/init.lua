local M = {}

local name = require("header.author")
local description = require("header.description")
local usage = require("header.usage")

local headers = {
    sh = [[
#!/bin/bash
# ===================================================================
# File name:     {filename}
# Author:        {author}
# Date:          {date}
# Description:   {description}
# Usage:         {usage}
# ===================================================================
]],
    python = [[
#!/usr/bin/env python3
"""
===================================================================
File name:     {filename}
Author:        {author}
Date:          {date}
Description:   {description}
Usage:         {usage}
===================================================================
"""
]],
    ruby = [[
#!/usr/bin/env ruby
# ===================================================================
# File name:     {filename}
# Author:        {author}
# Date:          {date}
# Description:   {description}
# Usage:         {usage}
# ===================================================================
]],
    lua = [[
-- ================================================================
-- File name:     {filename}
-- Author:        {author}
-- Date:          {date}
-- Description:   {description}
-- Usage:         {usage}
-- ================================================================
]],
    go = [[
/*
 * ===================================================================
 * File name:     {filename}
 * Author:        {author}
 * Date:          {date}
 * Description:   {description}
 * Usage:         {usage}
 * ===================================================================
 */
]],
    c = [[
/*
 * ===================================================================
 * File name:     {filename}
 * Author:        {author}
 * Date:          {date}
 * Description:   {description}
 * Usage:         {usage}
 * ===================================================================
 */
]],
    cpp = [[
/*
 * ===================================================================
 * File name:     {filename}
 * Author:        {author}
 * Date:          {date}
 * Description:   {description}
 * Usage:         {usage}
 * ===================================================================
 */
]],
    java = [[
/*
 * ===================================================================
 * File name:     {filename}
 * Author:        {author}
 * Date:          {date}
 * Description:   {description}
 * ===================================================================
 */
]],
    powershell = [[
 <#
 ===================================================================
 File name:     {filename}
 Author:        {author}
 Date:          {date}
 Description:   {description}
 Usage:         {usage}
 ===================================================================
 #>
]],
    dockerfile = [[
# ===================================================================
# File name:     {filename}
# Author:        {author}
# Date:          {date}
# Description:   {description}
# Usage:         {usage}
# ===================================================================
]],
    vbscript = [[
' ===================================================================
' File name:     {filename}
' Author:        {author}
' Date:          {date}
' Description:   {description}
' Usage:         {usage}
' ===================================================================
]]
}

function M.insert_header()
    local filetype = vim.bo.filetype
    local header = headers[filetype]

    if header then
        local author_name = name.get_author_name()
        local description_text = description.get_description()
        local filename = vim.fn.expand("%:t")
        local usage_text = usage.get_usage()

        local formatted_header =
            header:gsub("{date}", os.date("%Y-%m-%d")):gsub("{filename}", filename):gsub(
            "{description}",
            description_text
        ):gsub("{author}", author_name):gsub("{usage}", usage_text)

        vim.api.nvim_buf_set_lines(0, 0, 0, false, vim.split(formatted_header, "\n"))
    end
end

return M