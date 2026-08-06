const http = require('http');

const port = Number(process.env.PORT || 3001);
const redisUrl = process.env.REDIS_URL || '';

const server = http.createServer((req, res) => {
  if (req.url === '/health') {
    res.writeHead(200, { 'Content-Type': 'application/json' });
    res.end(JSON.stringify({ status: 'ok', service: 'backend', redisConfigured: Boolean(redisUrl) }));
    return;
  }

  if (req.url === '/api/hello') {
    res.writeHead(200, { 'Content-Type': 'application/json' });
    res.end(JSON.stringify({ message: 'Hello from the backend service', redisConfigured: Boolean(redisUrl) }));
    return;
  }

  res.writeHead(404, { 'Content-Type': 'application/json' });
  res.end(JSON.stringify({ error: 'Not found' }));
});

server.listen(port, () => {
  console.log(`Backend listening on port ${port}`);
});
