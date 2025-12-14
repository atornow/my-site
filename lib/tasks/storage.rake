namespace :storage do
  desc "Check Active Storage configuration and test file operations"
  task check: :environment do
    puts "=== Active Storage Configuration ==="
    puts "Service: #{Rails.configuration.active_storage.service}"
    puts "Resolve model to route: #{Rails.configuration.active_storage.resolve_model_to_route}"
    puts ""

    service = ActiveStorage::Blob.service
    puts "=== Service Details ==="
    puts "Class: #{service.class}"

    if service.is_a?(ActiveStorage::Service::DiskService)
      root = service.instance_variable_get(:@root)
      puts "Root path: #{root}"
      puts "Root exists: #{File.exist?(root)}"
      puts "Root writable: #{File.writable?(root)}"
      puts ""

      # Test write
      test_key = "test_#{Time.now.to_i}"
      test_content = "Test content"

      puts "=== Testing File Operations ==="
      begin
        service.upload(test_key, StringIO.new(test_content))
        puts "✓ Upload successful"

        downloaded = service.download(test_key)
        puts "✓ Download successful"
        puts "Content matches: #{downloaded == test_content}"

        service.delete(test_key)
        puts "✓ Delete successful"
      rescue => e
        puts "✗ Error: #{e.message}"
        puts e.backtrace.first(5)
      end
    end

    puts ""
    puts "=== Recent Blobs ==="
    ActiveStorage::Blob.order(created_at: :desc).limit(5).each do |blob|
      puts "Blob ##{blob.id}: #{blob.filename} (key: #{blob.key})"
      puts "  Service name: #{blob.service_name}"

      begin
        exists = service.exist?(blob.key)
        puts "  File exists: #{exists}"
      rescue => e
        puts "  Error checking existence: #{e.message}"
      end
    end
  end

  desc "Clean up orphaned blobs without files"
  task clean_orphaned: :environment do
    service = ActiveStorage::Blob.service

    puts "=== Cleaning Orphaned Blobs ==="
    ActiveStorage::Blob.find_each do |blob|
      if blob.service_name != Rails.configuration.active_storage.service.to_s
        puts "Deleting blob ##{blob.id} (wrong service: #{blob.service_name})"
        blob.purge
      elsif !service.exist?(blob.key)
        puts "Deleting blob ##{blob.id} (file missing: #{blob.key})"
        blob.purge
      end
    end
    puts "Done!"
  end
end
