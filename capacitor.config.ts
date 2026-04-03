import type { CapacitorConfig } from '@capacitor/cli';

const config: CapacitorConfig = {
  appId: 'com.collectify.app',
  appName: 'Collectify',
  webDir: 'public',
  server: {
    androidScheme: 'https',
    url: 'https://v0-co-l-le-c-ti-f-y.vercel.app',
    cleartext: false
  }
};

export default config;
