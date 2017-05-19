
// webtestView.cpp : CwebtestView 类的实现
//

#include "stdafx.h"
#include "webtest.h"

#include "webtestDoc.h"
#include "webtestView.h"

#ifdef _DEBUG
#define new DEBUG_NEW
#endif


// CwebtestView

IMPLEMENT_DYNCREATE(CwebtestView, CHtmlView)

BEGIN_MESSAGE_MAP(CwebtestView, CHtmlView)
	// 标准打印命令
	ON_COMMAND(ID_FILE_PRINT, &CHtmlView::OnFilePrint)
END_MESSAGE_MAP()

// CwebtestView 构造/析构

CwebtestView::CwebtestView()
{
	// TODO: 在此处添加构造代码

}

CwebtestView::~CwebtestView()
{
}

BOOL CwebtestView::PreCreateWindow(CREATESTRUCT& cs)
{
	// TODO: 在此处通过修改
	//  CREATESTRUCT cs 来修改窗口类或样式

	return CHtmlView::PreCreateWindow(cs);
}

void CwebtestView::OnInitialUpdate()
{
	CHtmlView::OnInitialUpdate();

	//Navigate2(_T("http://www.msdn.microsoft.com/visualc/"),NULL,NULL);
	Navigate2(_T("D:/WORKS/GitRepository/practice-code/mfc-example/webtest/Debug/power.html"),NULL,NULL);
}


// CwebtestView 打印



// CwebtestView 诊断

#ifdef _DEBUG
void CwebtestView::AssertValid() const
{
	CHtmlView::AssertValid();
}

void CwebtestView::Dump(CDumpContext& dc) const
{
	CHtmlView::Dump(dc);
}

CwebtestDoc* CwebtestView::GetDocument() const // 非调试版本是内联的
{
	ASSERT(m_pDocument->IsKindOf(RUNTIME_CLASS(CwebtestDoc)));
	return (CwebtestDoc*)m_pDocument;
}
#endif //_DEBUG


// CwebtestView 消息处理程序
