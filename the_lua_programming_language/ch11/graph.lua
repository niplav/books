function name2node(graph, name)
	local node=graph[name]
	if not node then
		node={name=name, adj={}}
		graph[name]=node
	end
	return node
end

function readgraph()
	local graph={}
	for line in io.lines() do
		local namefrom, nameto=string.match(line, "(%S+)%s+(%S+)")
		local from=name2node(graph, namefrom)
		local to=name2node(graph, nameto)
		from.adj[to]=true
	end
	return graph
end

function findpath(curr, to, path, visited)
	path=path or {}
	visited=visited or {}
	if visited[curr] then
		return nil
	end
	visited[curr]=true
	path[#path+1]=curr
	if curr==to then
		return path
	end
	for node in pairs(curr.adj) do
		local p=findpath(node, to, path, visited)
		if p then return p end
	end
	path[#path]=nil
end

function printpath(path)
	for i=1, #path do
		print(path[i].name)
	end
end
