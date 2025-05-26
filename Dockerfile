# Use the official Ruby image
FROM ruby:3.2.3-slim

# Install dependencies
RUN apt-get update -qq && \
    apt-get install --no-install-recommends -y \
    build-essential \
    curl \
    git \
    libpq-dev \
    libvips \
    pkg-config \
    postgresql-client \
    && rm -rf /var/lib/apt/lists/*

# Set working directory
WORKDIR /rails

# Copy Gemfile and install gems
COPY Gemfile Gemfile.lock ./
RUN bundle config --global frozen 1 && \
    bundle install --without development test && \
    rm -rf ~/.bundle/ "${BUNDLE_PATH}"/ruby/*/cache "${BUNDLE_PATH}"/ruby/*/bundler/gems/*/.git

# Copy application code
COPY . .

# Precompile assets for production
ENV RAILS_ENV=production
ENV RUBY_DEBUG_OPEN=false
ENV RUBY_DEBUG_LAZY=false
RUN SECRET_KEY_BASE_DUMMY=1 ./bin/rails assets:precompile

# Create a non-root user
RUN groupadd --system --gid 1000 rails && \
    useradd rails --uid 1000 --gid 1000 --create-home --shell /bin/bash && \
    chown -R rails:rails /rails

USER rails:rails

ENTRYPOINT ["/rails/bin/docker-entrypoint"]
# Expose port
EXPOSE 3000
CMD ["./bin/rails", "server", "-b", "0.0.0.0"]