namespace :incognito do
  desc "Delete all expired obfuscated paths"
  task cleanup: :environment do
    Incognito::ObfuscatedPath.where("expires_at < ?", Time.current).destroy_all
  end
end
