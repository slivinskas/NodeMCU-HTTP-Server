httpServer:listen(80)
print("Server is running")
-- Custom API
-- Get text/html
httpServer:use('/welcome', function(req, res)
    res:send('Hello ' .. req.query.name) -- /welcome?name=doge
end)

-- Get file
httpServer:use('/doge', function(req, res)
    res:sendFile('doge.jpg')
end)

-- Get file
httpServer:use('/vytis', function(req, res)
    res:sendFile('vytis.jpg')
end)

-- Get json
httpServer:use('/json', function(req, res)
    res:type('application/json')
    res:send('{"doge": "smile"}')
end)

-- Redirect
httpServer:use('/redirect', function(req, res)
    res:redirect('doge.jpg')
end)