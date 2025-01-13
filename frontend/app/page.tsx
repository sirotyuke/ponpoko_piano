'use client';

import { useEffect, useState } from 'react';

export default function Home() {
  const [message, setMessage] = useState<string>('');
  const [error, setError] = useState<string>('');

  useEffect(() => {
    const fetchMessage = async () => {
      try {
        const basePath = process.env.NEXT_PUBLIC_API_BASE_PATH || '/api';
        const response = await fetch(`${basePath}/`);
        if (!response.ok) {
          throw new Error('APIリクエストに失敗しました');
        }
        const data = await response.json();
        setMessage(data.message);
      } catch (err) {
        setError(err instanceof Error ? err.message : '予期せぬエラーが発生しました');
      }
    };

    fetchMessage();
  }, []);

  return (
    <main className="min-h-screen p-24">
      <div className="max-w-2xl mx-auto">
        <h1 className="text-4xl font-bold mb-8">ぽんぽこピアノ教室</h1>
        {error ? (
          <p className="text-red-500">{error}</p>
        ) : message ? (
          <div className="bg-white p-6 rounded-lg shadow-lg">
            <p className="text-xl">APIレスポンス: {message}</p>
          </div>
        ) : (
          <p>読み込み中...</p>
        )}
      </div>
    </main>
  );
} 