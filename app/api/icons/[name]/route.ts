import { readFileSync, statSync } from 'fs';
import { join } from 'path';
import { NextRequest, NextResponse } from 'next/server';

export async function GET(request: NextRequest, { params }: { params: { name: string } }) {
  try {
    const { name } = params;
    const filePath = join(process.cwd(), 'public', name);
    
    // Check if file exists
    const stats = statSync(filePath);
    if (!stats.isFile()) {
      return NextResponse.json({ error: 'File not found' }, { status: 404 });
    }
    
    // Read file content
    const content = readFileSync(filePath);
    
    // Set appropriate content type
    let contentType = 'application/octet-stream';
    if (name.endsWith('.png')) {
      contentType = 'image/png';
    } else if (name.endsWith('.jpg') || name.endsWith('.jpeg')) {
      contentType = 'image/jpeg';
    } else if (name.endsWith('.svg')) {
      contentType = 'image/svg+xml';
    }
    
    // Return file content
    return new NextResponse(content, {
      headers: {
        'Content-Type': contentType,
        'Content-Length': stats.size.toString(),
      },
    });
  } catch (error) {
    return NextResponse.json({ error: 'File not found' }, { status: 404 });
  }
}
