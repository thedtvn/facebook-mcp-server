# Use astral/uv image with latest tag
FROM astral/uv:python3.13-alpine

# Set working directory
WORKDIR /app

# Set environment variables
ENV PYTHONUNBUFFERED=1
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONIOENCODING=utf-8

# Copy dependency files
COPY pyproject.toml uv.lock ./

# Install dependencies using uv
RUN uv sync --frozen

# Copy source code
COPY src/ ./src/
COPY README.md .gitignore .python-version ./

# Create .env file placeholder (will be overridden by volume mount or environment variables)
COPY src/facebook_mcp_server/.env.example .env

# Set the default command to run the MCP server in stdio mode
CMD ["uv", "run", "facebook-mcp-server"]
