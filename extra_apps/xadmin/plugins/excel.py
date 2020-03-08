# coding:utf-8
import xadmin
from xadmin.views import BaseAdminPlugin, ListAdminView
from django.template import loader

# excel导入
class ListImportExcelPlugin(BaseAdminPlugin):
    import_excel = True

    def init_request(self, *args, **kwargs):
        return bool(self.import_excel)

    def block_top_toolbar(self, context, nodes):
        nodes.append(loader.render_to_string('xadmin/excel/'),context)

xadmin.site.register(ListImportExcelPlugin, ListAdminView)
