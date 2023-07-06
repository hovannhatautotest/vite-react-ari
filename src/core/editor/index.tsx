import React, { forwardRef, useEffect, useImperativeHandle, useRef } from 'react';
import { v4 } from 'uuid';

import { editorjsConfig } from './config';

export const Editor = forwardRef(({ value, onChange }: { value?: any; onChange?: any }, ref) => {
  useImperativeHandle(ref, () => ({}));
  useEffect(() => {
    setTimeout(() => {
      if (document.getElementById('editorjs' + id.current)) {
        import('@editorjs/editorjs').then(({ default: EditorJS }) => {
          const editor = new EditorJS({
            holder: 'editorjs' + id.current,
            onChange: async (api: any) => onChange(await api.saver.save()),
            ...editorjsConfig,
          });
          if (value) {
            setTimeout(() => {
              editor?.blocks.render(
                value.blocks
                  ? value
                  : {
                      blocks: [
                        {
                          id: 'r3s9SCBudq',
                          type: 'paragraph',
                          data: {
                            text: '',
                          },
                        },
                      ],
                    },
              );
            }, 1000);
          }
        });
      }
    });
  }, []);
  const id = useRef(v4());

  return <div id={'editorjs' + id.current}></div>;
});
Editor.displayName = 'Search';
