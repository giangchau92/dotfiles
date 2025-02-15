-- Meant to run at async context. (yazi system-clipboard)

local selected_or_hovered = ya.sync(function()
	local tab, paths = cx.active, {}
	for _, u in pairs(tab.selected) do
		paths[#paths + 1] = tostring(u)
	end
	if #paths == 0 and tab.current.hovered then
		paths[1] = tostring(tab.current.hovered.url)
	end
	return paths
end)

return {
	entry = function()
		ya.manager_emit("escape", { visual = true })

		local urls = selected_or_hovered()

		if #urls == 0 then
			return ya.notify({ title = "System Clipboard", content = "No file selected", level = "warn", timeout = 5 })
		end

        local path = urls[1]
        local cmd = string.format("osascript -e 'tell app \"Finder\" to set the clipboard to ( POSIX file \"%s\" )'", path);

        local success = os.execute(cmd)

		if success then
			ya.notify({
				title = "System Clipboard",
				content = "Succesfully copied the file(s) to system clipboard",
				level = "info",
				timeout = 5,
			})
		end

		if not success then
			ya.notify({
				title = "System Clipboard",
				content = string.format(
					"Could not copy selected file(s) %s",
					status and status.code or err
				),
				level = "error",
				timeout = 5,
			})
		end
	end,
}
