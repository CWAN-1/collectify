import type { CapacitorConfig } from '@capacitor/cli';

const config: CapacitorConfig = {
  appId: 'com.collectify.app',
  appName: 'Collectify',
  webDir: 'public',
  server: {
    androidScheme: 'https',
    url: 'https://collectify-silk.vercel.app',
    cleartext: false
  }
};

export default config;
