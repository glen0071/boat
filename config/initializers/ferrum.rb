Ferrum::Browser.new(
  headless: true,
  browser_path: ENV.fetch('GOOGLE_CHROME_SHIM', nil),
  args: %w[no-sandbox disable-gpu disable-dev-shm-usage]
)
