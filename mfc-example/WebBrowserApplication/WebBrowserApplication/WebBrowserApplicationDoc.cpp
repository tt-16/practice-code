// ��� MFC ʾ��Դ������ʾ���ʹ�� MFC Microsoft Office Fluent �û����� 
// ("Fluent UI")����ʾ������Ϊ�ο������ṩ�� 
// ���Բ��䡶Microsoft ������ο����� 
// MFC C++ ������渽����ص����ĵ���
// ���ơ�ʹ�û�ַ� Fluent UI ����������ǵ����ṩ�ġ�
// ��Ҫ�˽��й� Fluent UI ��ɼƻ�����ϸ��Ϣ�������  
// http://msdn.microsoft.com/officeui��
//
// ��Ȩ���� (C) Microsoft Corporation
// ��������Ȩ����

// WebBrowserApplicationDoc.cpp : CWebBrowserApplicationDoc ���ʵ��
//

#include "stdafx.h"
#include "WebBrowserApplication.h"

#include "WebBrowserApplicationDoc.h"

#ifdef _DEBUG
#define new DEBUG_NEW
#endif


// CWebBrowserApplicationDoc

IMPLEMENT_DYNCREATE(CWebBrowserApplicationDoc, CDocument)

BEGIN_MESSAGE_MAP(CWebBrowserApplicationDoc, CDocument)
END_MESSAGE_MAP()


// CWebBrowserApplicationDoc ����/����

CWebBrowserApplicationDoc::CWebBrowserApplicationDoc()
{
	// TODO: �ڴ����һ���Թ������

}

CWebBrowserApplicationDoc::~CWebBrowserApplicationDoc()
{
}

BOOL CWebBrowserApplicationDoc::OnNewDocument()
{
	if (!CDocument::OnNewDocument())
		return FALSE;

	// TODO: �ڴ�������³�ʼ������
	// (SDI �ĵ������ø��ĵ�)

	return TRUE;
}




// CWebBrowserApplicationDoc ���л�

void CWebBrowserApplicationDoc::Serialize(CArchive& ar)
{
	if (ar.IsStoring())
	{
		// TODO: �ڴ���Ӵ洢����
	}
	else
	{
		// TODO: �ڴ���Ӽ��ش���
	}
}


// CWebBrowserApplicationDoc ���

#ifdef _DEBUG
void CWebBrowserApplicationDoc::AssertValid() const
{
	CDocument::AssertValid();
}

void CWebBrowserApplicationDoc::Dump(CDumpContext& dc) const
{
	CDocument::Dump(dc);
}
#endif //_DEBUG


// CWebBrowserApplicationDoc ����
