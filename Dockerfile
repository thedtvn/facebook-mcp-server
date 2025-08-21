# Use astral/uv image with latest tag
FROM astral/uv:python3.13-alpine

# Set working directory
WORKDIR /app

# Set environment variables
ENV PYTHONUNBUFFERED=1
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONIOENCODING=utf-8

# Copy src code
COPY . .

# Install dependencies using uv
RUN uv sync --frozen

# Set the default command to run the MCP server in stdio mode
CMD ["uv", "run", "facebook-mcp-server"]
